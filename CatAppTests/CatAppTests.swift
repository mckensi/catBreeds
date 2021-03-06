//
//  CatAppTests.swift
//  CatAppTests
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import XCTest
@testable import CatApp

class CatAppTests: XCTestCase {

    let viewModel = BreedsViewModel()
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetBreend() throws {
        let expectation = self.expectation(description: "Get Breeds")
        viewModel.listBreedsCatsRes = { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        viewModel.onFailure = {
            XCTFail()
        }
        viewModel.getBreedsCats(page: 0)
        
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetBreendByName() throws {
          let expectation = self.expectation(description: "Get Breeds by name")
          viewModel.listBreedsCatsByNameRes = { response in
              XCTAssertNotNil(response)
              expectation.fulfill()
          }
          
          viewModel.onFailure = {
              XCTFail()
          }
        
          viewModel.getBreedsCatsByName(textSearch: "Ameri")
          
          self.waitForExpectations(timeout: 10, handler: nil)
      }

}
