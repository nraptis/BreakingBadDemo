//
//  BreakingSwiftTests.swift
//  BreakingSwiftTests
//
//  Created by Nick Raptis on 12/31/20.
//

import XCTest
@testable import BreakingSwift

class BreakingSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testService() {
        let exp = XCTestExpectation()
        runServiceTest() { result in
            switch result {
            case .success:
                exp.fulfill()
            case .failure(let error):
                XCTFail("\(error.localizedDescription)")
            }
        }
    }
    
    func testWalter() {
        let exp = XCTestExpectation()
        runServiceTest() { result in
            switch result {
            case .success(let data):
                for model in data.modelList {
                    if model.name.lowercased().starts(with: "walt") {
                        exp.fulfill()
                    }
                }
                
            case .failure(let error):
                XCTFail("\(error.localizedDescription)")
            }
        }
    }
    
    func runServiceTest(completion: @escaping BreakingBadService.CharacterRequestCompletion) {
        let service = BreakingBadService()
        service.makeRequest() {
            completion($0)
        }
    }

}
