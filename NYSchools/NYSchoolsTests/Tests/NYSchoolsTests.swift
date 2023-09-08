//
//  NYSchoolsTests.swift
//  NYSchoolsTests
//
//  Created by Dustin Pavy on 9/6/23.
//

import XCTest
@testable import NYSchools

final class NYSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSchoolListWhenWeExpectCorrectData() async throws{
        
        let mockRepository = MockRepository()
        let viewModel = await ViewModel(repository: mockRepository)
        
        mockRepository.setSchoolList(list: SchoolObject.mockSchoolList())
        mockRepository.setSchoolScoreList(list: SchoolScoresObject.mockSchoolScoreList())
        await viewModel.getListsFromApi()
        
        XCTAssertNotNil(viewModel)
        let schoolList = await viewModel.schoolInfoList
        XCTAssertEqual(schoolList.count, 1)
        
        let firstSchool = schoolList.first
        XCTAssertEqual(firstSchool?.school_name, "Clinton School Writers & Artists, M.S. 260")
        XCTAssertEqual(firstSchool?.dbn, "02M260")
        
        let schoolScoreList = await viewModel.schoolScoresList
        XCTAssertEqual(schoolScoreList.count, 1)
        
        let firstScore = schoolScoreList.first
        XCTAssertEqual(firstScore?.dbn, "01M292")
        XCTAssertEqual(firstScore?.school_name, "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES")
        
        let error = await viewModel.customError
        XCTAssertNil(error)
    }
    
    func testSchoolListWhenWeExpectInvalidURL() async throws{
        
        let mockRepository = MockRepository()
        let viewModel = await ViewModel(repository: mockRepository)
        
        mockRepository.setError(error: CustomNetworkError.invalidURL)
        await viewModel.getListsFromApi()
        XCTAssertNotNil(viewModel)
        
        let schoolList = await viewModel.schoolInfoList
        XCTAssertEqual(schoolList.count, 0)
        let firstSchool = schoolList.first
        XCTAssertNil(firstSchool)
        
        let scoreList = await viewModel.schoolScoresList
        XCTAssertEqual(scoreList.count, 0)
        let firstScore = scoreList.first
        XCTAssertNil(firstScore)
        
        let error = await viewModel.customError
        XCTAssertEqual(error, CustomNetworkError.invalidURL)
    }
    
    func testSchoolListWhenWeExpectWrongURL() async throws{
        
        let mockRepository = MockRepository()
        let viewModel = await ViewModel(repository: mockRepository)
        
        mockRepository.setError(error: CustomNetworkError.dataNotFound)
        await viewModel.getListsFromApi()
        XCTAssertNotNil(viewModel)
        
        let schoolList = await viewModel.schoolInfoList
        XCTAssertEqual(schoolList.count, 0)
        let firstSchool = schoolList.first
        XCTAssertNil(firstSchool)
        
        let scoreList = await viewModel.schoolScoresList
        XCTAssertEqual(scoreList.count, 0)
        let firstScore = scoreList.first
        XCTAssertNil(firstScore)
        
        let error = await viewModel.customError
        XCTAssertEqual(error, CustomNetworkError.dataNotFound)
    }

    func testSchoolListWhenWeExpectParsingError() async throws{
        
        let mockRepository = MockRepository()
        let viewModel = await ViewModel(repository: mockRepository)
        
        mockRepository.setError(error: CustomNetworkError.parsingFailed)
        await viewModel.getListsFromApi()
        XCTAssertNotNil(viewModel)
        
        let schoolList = await viewModel.schoolInfoList
        XCTAssertEqual(schoolList.count, 0)
        let firstSchool = schoolList.first
        XCTAssertNil(firstSchool)
        
        let scoreList = await viewModel.schoolScoresList
        XCTAssertEqual(scoreList.count, 0)
        let firstScore = scoreList.first
        XCTAssertNil(firstScore)
        
        let error = await viewModel.customError
        XCTAssertEqual(error, CustomNetworkError.parsingFailed)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
