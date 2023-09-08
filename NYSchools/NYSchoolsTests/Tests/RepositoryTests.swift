//
//  RepositoryTests.swift
//  NYSchoolsTests
//
//  Created by Dustin Pavy on 9/8/23.
//

import XCTest
@testable import NYSchools

final class RepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFruitRepositoryWhenWeExpectEverythingIsCorrect() async throws {
        //given
        let fakeNetworkManager = FakeNetworkManager()
        let schoolRepository = SchoolRepository(networkManager: fakeNetworkManager)
        //when
        fakeNetworkManager.mockPath = "SchoolTest"
        
        do{
            let schoolList = try await schoolRepository.getSchoolInfoList()
            //then
            XCTAssertNotNil(schoolList)
            XCTAssertNotNil(fakeNetworkManager)
            XCTAssertEqual(schoolList.count, 3)
        } catch{
            XCTAssertNil(error)
        }
    }
    
    func testFruitRepositoryWhenWeExpectNoData() async throws {
        //given
        let fakeNetworkManager = FakeNetworkManager()
        let schoolRepository = SchoolRepository(networkManager: fakeNetworkManager)
        //when
        fakeNetworkManager.mockPath = "SchoolTestEmpty"
        
        do{
            let schoolList = try await schoolRepository.getSchoolInfoList()
            //then
            XCTAssertNotNil(schoolList)
            XCTAssertNotNil(fakeNetworkManager)
        } catch{
            XCTAssertNotNil(error)
        }
    }

    func testFruitRepositoryWhenWeExpectParsingError() async throws {
        //given
        let fakeNetworkManager = FakeNetworkManager()
        let schoolRepository = SchoolRepository(networkManager: fakeNetworkManager)
        //when
        fakeNetworkManager.mockPath = "SchoolTestBadParse"
        
        do{
            let schoolList = try await schoolRepository.getSchoolInfoList()
            //then
            XCTAssertNotNil(schoolList)
            XCTAssertNotNil(fakeNetworkManager)
        } catch{
            XCTAssertNotNil(error)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
