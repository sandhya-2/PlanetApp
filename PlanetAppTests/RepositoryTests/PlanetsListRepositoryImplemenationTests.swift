//
//  PlanetsListRepositoryImplemenationTests.swift
//  PlanetAppTests
//
//  Created by admin on 19/04/2023.
//

import XCTest
@testable import PlanetApp

final class PlanetsListRepositoryImplemenationTests: XCTestCase {

    var mockRestAPIManager: MockRestAPIManager!
    
    @MainActor override func setUp() {
        mockRestAPIManager = MockRestAPIManager()
    }
    
    override func tearDown() {
        mockRestAPIManager = nil
    }

    // when networkManager return success data
    func testWhenGetPlanetsListSuccess() async {
        
        let planetsRepository = PlanetsListRepositoryImplemenation(networkManager: MockRestAPIManager(),persistence: PersistenceController(inMemory: true))

        let lists = try? await planetsRepository.getPlanets(for: URL(string: "PlanetsListResponseData")!)
        XCTAssertNotNil(lists)
        XCTAssertEqual(lists?.count, 10)
    }

    //     when fails, planets list data is not nil but when we don't get the data
    func testWhenGetPlanetsListWhenGetNoData() async throws {
        // GIVEN
        
        let planetsRepository = PlanetsListRepositoryImplemenation(networkManager: MockRestAPIManager(),persistence: PersistenceController(inMemory: true))
        
        let lists = try? await planetsRepository.getPlanets(for: URL(string: "PlanetsListEmpty")!)
        XCTAssertEqual(lists?.count, 0)
    }

    //     when fails, planets list data is not nil and no data
    func testWhenGetPlanetsListFailsButDataIStoredLocally() async throws {
        // GIVEN
        
        let planetsRepository = PlanetsListRepositoryImplemenation(networkManager: MockRestAPIManager(),persistence: PersistenceController(inMemory: true))
        
        let _ = try? await planetsRepository.getPlanets(for: URL(string: "PlanetsListResponseData")!)
        
       
        let lists = try? await planetsRepository.getPlanets(for: URL(string: "PlanetsListResponseDataKeyMisMatch")!)
        XCTAssertEqual(lists?.count, 10)
    }
   
   
}
