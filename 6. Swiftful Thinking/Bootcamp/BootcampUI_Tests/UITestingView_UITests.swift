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
        signUpAndSignIn(shouldTypeOnKeyboard: false)

        let navBar = app.navigationBars["Welcome"]
        
        // then
        XCTAssertFalse(navBar.exists)
    }
    
    func test02_UITestingView_signUpButton_shouldSignIn() {
        // when
        signUpAndSignIn(shouldTypeOnKeyboard: true)

        let navBar = app.navigationBars["Welcome"]
        
        // then
        XCTAssertTrue(navBar.exists)
    }
    
    func test03_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // given
        signUpAndSignIn(shouldTypeOnKeyboard: true)

        // when
        tapAlertButton(shouldDismissAlert: false)
        
        // then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
    
    func test04_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        // given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapAlertButton(shouldDismissAlert: true)
        
        // then
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
    }
    
    func test05_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // when
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // given
        tapNavigationLink(shouldDismissDestination: false)
        
        // then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func test06_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapNavigationLink(shouldDismissDestination: true)
        
        // then
        let navBar = app.navigationBars["Welcome"]
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

// MARK: - FUNCTIONS

extension UITestingView_UITests {
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        let textField = app.textFields["SignUpTextField"]
        textField.forceTapElement()
        
        if shouldTypeOnKeyboard {
            let keyA = app.keys["A"]
            keyA.forceTapElement()
        }
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        app.buttons["SignUpButton"].forceTapElement()
    }
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.forceTapElement()
        
        if shouldDismissAlert {
            let alert = app.alerts.firstMatch
            let alertOKButton = alert.buttons["OK"]
            
            let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOKButtonExists)
            
            alertOKButton.forceTapElement()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.forceTapElement()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.forceTapElement()
        }
    }
}
