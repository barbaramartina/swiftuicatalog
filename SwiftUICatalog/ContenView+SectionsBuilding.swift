//
//  ContenView+SectionsBuilding.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-05-12.
//
import Foundation
import SwiftUI

extension ContentView {

    // MARK: - Build the sections

    var sectionContainer: SectionContainer {
        let controls = MenuSection(
            name: "Controls",
            state: .ready,
            items: controlsItems
        )
        let storeKit = MenuSection(
            name: "Store Kit",
            state: .notPublishable,
            items: storeKitItems
        )
        let layouts = MenuSection(
            name: "Layouts",
            state: .ready,
            items: layoutsItems
        )
        let hierachicalViews = MenuSection(
            name: "Hierarchical Views",
            state: .ready,
            items: hierachicalViewsItems
        )
        let drawings = MenuSection(
            name: "Drawings",
            state: .ready,
            items: drawingsItems
        )
        let charts = MenuSection(
            name: "charts",
            state: .ready,
            items: chartsItems
        )
        let gestures = MenuSection(
            name: "Gestures",
            state: .ready,
            items: gesturesItems
        )
        let viewModifiers = MenuSection(
            name: "View Modifiers",
            state: .ready,
            items: viewModifiersItems
        )
        let accessibility = MenuSection(
            name: "Accessibility",
            state: .ready,
            items: accessibilityItems
        )
        let statusBars = MenuSection(
            name: "Status Bars",
            state: .notPublishable,
            items: statusBarsItems
        )
        let stylingSection = MenuSection(
            name: "Styling",
            state: .ready,
            items: stylingSectionItems
        )
        let popovers = MenuSection(
            name: "Popovers",
            state: .ready,
            items: popoversItems
        )
        let composedComponents = MenuSection(
            name: "Composed Components",
            state: .ready,
            items: composedComponentsItems
        )

        return SectionContainer(sections: [
            controls,
            storeKit,
            layouts,
            hierachicalViews,
            drawings,
            charts,
            gestures,
            viewModifiers,
            accessibility,
            statusBars,
            stylingSection,
            popovers,
            composedComponents,
        ])
    }

}
