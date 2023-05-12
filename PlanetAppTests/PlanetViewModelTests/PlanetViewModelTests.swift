//
//  PlanetViewModelTests.swift
//  PlanetAppTests
//
//  Created by Sandiya on 20/04/2023.
//

import XCTest
@testable import PlanetApp

final class PlanetViewModelTests: XCTestCase {
    
    var viewModel: PlanetViewModel!
    var fakeRepository: MockRepository!
    
    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        fakeRepository = MockRepository()
        
        self.viewModel = PlanetViewModel(repository: fakeRepository)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewModel = nil
    }

    func testgetDataForPlanets_When_Everything_isCorrect() async {
        XCTAssertNotNil(viewModel)
        
        fakeRepository.setResponse(planets: Planet.mockPlanets())
        let expectation = XCTestExpectation(description: "Fetching Planet list")
        await viewModel.getDataForPlanets(urlString: "PlanetListResponseData")
        
        let planet = await self.viewModel.planetList.first
        let localError = await self.viewModel.customError
        XCTAssertEqual("Tatooine", planet?.name)
        XCTAssertEqual("1 standard", planet?.gravity)
        XCTAssertEqual("200000", planet?.population)
        XCTAssertEqual("arid", planet?.climate)
        XCTAssertNil(localError)
        
        expectation.fulfill()
    }

    func testgetDataForPlanets_When_URL_isNotGiven() async {
        XCTAssertNotNil(viewModel)
        
        let expectation = XCTestExpectation(description: "Invalid URL! No data received")
        await viewModel.getDataForPlanets(urlString: "")
        
        let planetList = await self.viewModel.planetList
        let localError = await self.viewModel.customError
        
        XCTAssertEqual(planetList.count, 0)
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, NetworkError.invalidURL)
        expectation.fulfill()
                
    }
    
    func testgetDataForPlanets_When_URL_isCorrect_ButAPIFails() async {
        XCTAssertNotNil(viewModel)
        
        fakeRepository.setError(error: .dataNotFound)
        await viewModel.getDataForPlanets(urlString: "PlanetListEmpty")
        let expectation = XCTestExpectation(description: "API should fail to give the data")
        
        let planeList = await self.viewModel.planetList
        let localError = await self.viewModel.customError
        
        XCTAssertEqual(planeList.count, 0)
        
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, .dataNotFound)
        expectation.fulfill()
               
    }
    
}
