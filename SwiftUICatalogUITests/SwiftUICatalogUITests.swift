//
//  SwiftUICatalogUITests.swift
//  SwiftUICatalogUITests
//
//  Created by Barbara Rodeker on 29.11.21.
//

import XCTest

class SwiftUICatalogUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
    }
    
    func testGoToMenu() throws {
        snapshot("01")
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Menus"]/*[[".cells[\"Menus\"].buttons[\"Menus\"]",".buttons[\"Menus\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        snapshot("02")
    }

    func testGoToButtons() throws {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Buttons"]/*[[".cells[\"Buttons\"].buttons[\"Buttons\"]",".buttons[\"Buttons\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("03")
    }
    
    func testGoToSteppers() throws {
        let tablesQuery = app.tables
        tablesQuery.buttons["Steppers"].tap()
        snapshot("04")
    }

    func testGoToPickers() throws {
        let tablesQuery = app.tables
        tablesQuery.buttons["Pickers"].tap()
        snapshot("05")
    }

}
