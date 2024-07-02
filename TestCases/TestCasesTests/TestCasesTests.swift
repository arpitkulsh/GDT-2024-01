//
//  TestCasesTests.swift
//  TestCasesTests
//
//  Created by Arpit on 01/07/24.
//

import XCTest
@testable import TestCases

final class TestCasesTests: XCTestCase {
    
    var loginManager: LoginManager!
    
    override class func setUp() {
        super.setUp()
        
    }
    
    override class func tearDown() {
        super.tearDown()
        
    }
    
    override func setUp() {
        super.setUp()
        loginManager = LoginManager()
        print("1")
    }
    
    override func tearDown() {
        super.tearDown()
        loginManager = nil
        print("2")
    }
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testAssertEqual() {
        let sum = 2 + 4
        
        XCTAssertEqual(sum, 6, "Sum is coorect and must be 5")
    }
    
    func testAssertNotEqual() {
        let sum = 2 + 4
        
        XCTAssertNotEqual(sum, 8, "Sum is coorect and must be 5")
    }
    
    func testTestNil() {
        let optionalvalue: String? = nil
        
        XCTAssertNil(optionalvalue, "Value is nil")
    }
    
    func testTestNotNil() {
        let optionalvalue: String? = "nil"
        
        XCTAssertNotNil(optionalvalue, "Value is nil")
    }
    
    // XCAssert, XCTAssertFalse, XCTAssertTrue
    func testAssert() {
        let condition1 = true
        let condition2 = false
        
        if condition1 == true {
            XCTAssertTrue(condition1, "Condition is passed")
        }
        else {
            XCTAssertFalse(condition2, "Condition is passed")
        }
    }
    
    func testFail() {
        XCTFail("This test case getfailed")
    }
    
    func testloginSuccessFailure() {
        let result = loginManager.login(username: "testUser", password: "testPassword")
        XCTAssertTrue(result, "Login is Not Success")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}



// Unit Testing with XCTest and XCUITest
