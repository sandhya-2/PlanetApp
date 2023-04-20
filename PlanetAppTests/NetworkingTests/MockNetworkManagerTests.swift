//
//  MockNetworkManagerTests.swift
//  PlanetAppTests
//
//  Created by admin on 19/04/2023.
//

import XCTest
@testable import PlanetApp

final class MockNetworkManagerTests: XCTestCase {

    var mockNetworking: MockNetworking!
    var networkManager: NetworkManager!
    
    @MainActor override func setUp() {
        mockNetworking = MockNetworking()
        networkManager = NetworkManager(urlSession: mockNetworking)
    }

    override func tearDown() {
        mockNetworking = nil
        networkManager = nil
    }

    /*when API is successful, get function will return expected data*/
    func testGetPlanentsWhenResponseIs_200() async {
        
        // GIVEN
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "test")!, statusCode: 200, httpVersion:nil, headerFields:nil)
        
        // When
        let actualData = try! await networkManager.get(url: URL(string: "testURl")!)
        
        // Then
        XCTAssertEqual(actualData, data)
    }
    
    /*when API is fails with status code 404 */
    func testGetPlanetsWhenAPIFailsToReturnExpectedData() async {

        // Given
         let data = "response".data(using: .utf8)
        mockNetworking.mockData = data
        mockNetworking.mockResponse = HTTPURLResponse(url:URL(string: "test")!, statusCode: 404, httpVersion:nil, headerFields:nil)
        
        do {
            _ = try await networkManager.get(url: URL(string: "testURl")!)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidURL)
        }
    }
    
    /*when API is fails with request invalid*/
    func testPlanetsWhenRequestIsInValidAndYouDontGetData() async {
        do {
            mockNetworking.error =  NetworkError.invalidURL
            _ = try await networkManager.get(url: URL(string: "skdjflkjdlg")!)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
        }
    }

}
