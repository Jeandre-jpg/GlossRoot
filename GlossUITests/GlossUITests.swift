//
//  GlossUITests.swift
//  GlossUITests
//
//  Created by Jeandré De Villiers on 2022/10/28.
//

import XCTest

final class GlossUITests: XCTestCase {

    func testLogo() throws {
        let app = XCUIApplication()
        app.launch()
     
        let logo = app.staticTexts.element
     
        XCTAssert(logo.exists)
        XCTAssertEqual(logo.label, "Gloss")
    }
    
//    func testPretty() throws {
//        let app = XCUIApplication()
//        app.launch()
//
//        let label = app.staticTexts.element
//
//        XCTAssert(label.exists)
//        XCTAssertEqual(label.label, "Pretty")
//    }
    
    func testImage() throws{
        let app = XCUIApplication()
        app.launch()
        
        let image = app.images["LogoMain"]
            
        XCTAssert(image.exists)
    }
}
