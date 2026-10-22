import os
import re
from pathlib import Path
from typing import Dict, List, Optional
from mcp.server.fastmcp import FastMCP

# Initialize FastMCP Server
mcp = FastMCP("SwiftUI Catalog MCP")

# Configurable catalog path via environment variable or default relative path
CATALOG_PATH = Path(os.getenv("CATALOG_PATH", "../SwiftUICatalog")).resolve()


class CatalogIndexer:
    def __init__(self, root_path: Path):
        self.root_path = root_path
        self.snippets: List[Dict] = []

    def index(self):
        """Scans the repository and builds an in-memory snippet index."""
        self.snippets.clear()
        if not self.root_path.exists():
            print(f"Warning: Catalog path '{self.root_path}' does not exist.")
            return

        for swift_file in self.root_path.rglob("*.swift"):
            try:
                content = swift_file.read_text(encoding="utf-8")
                metadata = self._parse_metadata(content, swift_file)
                self.snippets.append(metadata)
            except Exception as e:
                print(f"Error reading {swift_file}: {e}")

    def _parse_metadata(self, content: str, file_path: Path) -> Dict:
        """Extracts MCP metadata annotations or falls back to automatic detection."""
        symbol_match = re.search(r"//\s*@symbol:\s*(.+)", content)
        category_match = re.search(r"//\s*@category:\s*(.+)", content)
        tags_match = re.search(r"//\s*@tags:\s*(.+)", content)

        symbol = symbol_match.group(1).strip() if symbol_match else file_path.stem
        category = category_match.group(1).strip() if category_match else "swiftui"
        
        if tags_match:
            tags = [t.strip() for t in tags_match.group(1).split(",")]
        else:
            tags = ["views"]

        return {
            "id": file_path.stem.lower(),
            "symbol": symbol,
            "category": category,
            "tags": tags,
            "file_path": str(file_path),
            "code": content
        }

    def search(self, query: str, category: Optional[str] = None) -> List[Dict]:
        """Filters snippets matching the search query and optional category."""
        q = query.lower()
        results = []
        for s in self.snippets:
            matches_cat = not category or s["category"].lower() == category.lower()
            matches_query = (
                q in s["symbol"].lower()
                or any(q in tag.lower() for tag in s["tags"])
                or q in s["code"].lower()
            )
            if matches_cat and matches_query:
                results.append(s)
        return results

    def get_by_id(self, snippet_id: str) -> Optional[Dict]:
        """Finds a snippet by its unique ID."""
        for s in self.snippets:
            if s["id"] == snippet_id.lower():
                return s
        return None


# Instantiate indexer and build index at startup
indexer = CatalogIndexer(CATALOG_PATH)
indexer.index()


# ------------------------------------------------------------------------------
# MCP Tools
# ------------------------------------------------------------------------------

@mcp.tool()
def search_snippets(query: str, category: Optional[str] = None) -> str:
    """Search SwiftUICatalog for code examples by keyword, feature, metal shader, or chart type.

    Args:
        query: Search term (e.g., 'BarChart', 'Ripple Shader', 'Toggle', 'Glassmorphism')
        category: Optional filter ('swiftui', 'charts', or 'metal')
    """
    results = indexer.search(query, category)
    if not results:
        return f"No snippets found matching query '{query}'."

    output = []
    for r in results:
        preview = r["code"][:250].replace("\n", " ") + "..."
        output.append(
            f"ID: {r['id']}\n"
            f"Symbol: {r['symbol']}\n"
            f"Category: {r['category']}\n"
            f"Tags: {', '.join(r['tags'])}\n"
            f"Path: {r['file_path']}\n"
            f"Preview: {preview}\n"
            "---"
        )

    return "\n\n".join(output)


@mcp.tool()
def get_snippet_code(snippet_id: str) -> str:
    """Retrieve the complete Swift source code for a specific catalog snippet.

    Args:
        snippet_id: The identifier of the snippet (e.g., 'buttonsview', 'waterrippleview')
    """
    snippet = indexer.get_by_id(snippet_id)
    if not snippet:
        return f"Error: Snippet with ID '{snippet_id}' was not found."

    return f"// File: {snippet['file_path']}\n// Category: {snippet['category']}\n\n{snippet['code']}"


@mcp.tool()
def refresh_index() -> str:
    """Re-scans the repository directory and updates the snippet index."""
    indexer.index()
    return f"Index refreshed successfully. Total snippets indexed: {len(indexer.snippets)}"


# ------------------------------------------------------------------------------
# MCP Resources
# ------------------------------------------------------------------------------

@mcp.resource("swiftui-catalog://snippet/{snippet_id}")
def snippet_resource(snippet_id: str) -> str:
    """Provides direct resource access to a snippet's code by URI."""
    snippet = indexer.get_by_id(snippet_id)
    if not snippet:
        raise ValueError(f"Snippet '{snippet_id}' not found.")
    return snippet["code"]


if __name__ == "__main__":
    # Runs stdio transport by default
    mcp.run()
