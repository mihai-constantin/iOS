//
//  UITestingView_UITests.swift
//  BootcampUI_Tests
//
//  Created by Mihai Constantin on 23.05.2024.
//

import XCTest

final class UITestingView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test01_UITestingView_signUpButton_shouldNotSignIn() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.forceTapElement()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()

        let navBar = app.navigationBars["Welcome"]
        
        // then
        XCTAssertFalse(navBar.exists)
    }
    
    func test02_UITestingView_signUpButton_shouldSignIn() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.forceTapElement()
        
        let keyA = app.keys["A"]
        let keyAExists = keyA.waitForExistence(timeout: 5)
        keyA.forceTapElement()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()

        let navBar = app.navigationBars["Welcome"]
        
        // then
        XCTAssertTrue(navBar.exists)
    }
    
    func test03_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.forceTapElement()
        
        app.keys["D"].forceTapElement()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.forceTapElement()
        
        let alert = app.alerts.firstMatch
        
        // then
        XCTAssertTrue(alert.exists)
    }
    
    func test04_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.forceTapElement()
        
        app.keys["D"].forceTapElement()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.forceTapElement()
        
        let alert = app.alerts.firstMatch
        let alertOKButton = alert.buttons["OK"]
        
        let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOKButtonExists)
        
        alertOKButton.forceTapElement()
        
        // then
        let alertExists = alert.waitForExistence(timeout: 5)
    }
    
    func test05_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        
    }
    
    func test06_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.forceTapElement()
        
        app.keys["D"].forceTapElement()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.forceTapElement()
        
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
        
        let backButton = app.navigationBars.buttons["Welcome"]
        backButton.forceTapElement()
        
        // then
        XCTAssertTrue(navBar.exists)
    }
}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
