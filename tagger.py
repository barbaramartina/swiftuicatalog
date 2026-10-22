import os
import re

# Repository directory path
CATALOG_DIR = "./SwiftUICatalog"

# Classification rules based on keywords/imports
RULES = {
    "charts": {
        "category": "charts",
        "tags": ["charts", "data-visualization"],
        "patterns": [r"import Charts", r"Chart\s*\{", r"BarMark", r"LineMark", r"SectorMark"]
    },
    "metal": {
        "category": "metal",
        "tags": ["metal", "shaders", "effects"],
        "patterns": [r"ShaderLibrary", r"\.colorEffect", r"\.distortionEffect", r"\.layerEffect"]
    },
    "controls": {
        "category": "swiftui",
        "tags": ["controls", "user-input"],
        "patterns": [r"Button\(", r"Toggle\(", r"Slider\(", r"Picker\(", r"TextField\("]
    },
    "layouts": {
        "category": "swiftui",
        "tags": ["layouts", "containers"],
        "patterns": [r"HStack", r"VStack", r"ZStack", r"Grid\(", r"Form\(", r"List\("]
    },
    "navigation": {
        "category": "swiftui",
        "tags": ["navigation", "hierarchical"],
        "patterns": [r"NavigationStack", r"NavigationSplitView", r"TabView", r"DisclosureGroup"]
    },
    "animations": {
        "category": "swiftui",
        "tags": ["animations", "motion"],
        "patterns": [r"withAnimation", r"\.matchedGeometryEffect", r"PhaseAnimator"]
    }
}

def analyze_and_tag_file(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Skip files that already have MCP Metadata
    if "// MARK: - MCP Metadata" in content:
        print(f"Skipping (already tagged): {file_path}")
        return

    detected_category = "swiftui"
    detected_tags = set()

    for rule_name, rule_data in RULES.items():
        for pattern in rule_data["patterns"]:
            if re.search(pattern, content):
                detected_tags.update(rule_data["tags"])
                if rule_data["category"] != "swiftui":
                    detected_category = rule_data["category"]

    if not detected_tags:
        detected_tags.add("views")

    # Construct Metadata Header
    symbol_name = os.path.splitext(os.path.basename(file_path))[0]
    metadata_header = f"""// MARK: - MCP Metadata
// @symbol: {symbol_name}
// @category: {detected_category}
// @tags: {', '.join(sorted(detected_tags))}
// ---

"""

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(metadata_header + content)

    print(f"Tagged {file_path} -> Category: {detected_category}, Tags: {list(detected_tags)}")

def process_repository(root_dir):
    for root, _, files in os.walk(root_dir):
        for file in files:
            if file.endswith(".swift"):
                full_path = os.path.join(root, file)
                analyze_and_tag_file(full_path)

if __name__ == "__main__":
    process_repository(CATALOG_DIR)