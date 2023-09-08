//
//  MockRepository.swift
//  NYSchoolsTests
//
//  Created by Consultant on 9/8/23.
//

import Foundation
@testable import NYSchools

class MockRepository:SchoolRepositoryAction{
    private var error:CustomNetworkError?
    private var schoolList: [SchoolObject]?
    private var schoolScoreList: [SchoolScoresObject]?
    
    func getSchoolScoresList() async throws -> [SchoolScoresObject] {
        if error != nil{
            throw error!
        }
        return schoolScoreList!
    }
    
    func getSchoolInfoList() async throws -> [SchoolObject] {
        if error != nil{
            throw error!
        }
        return schoolList!
    }
    
    func setSchoolList(list:[SchoolObject]){
        self.schoolList = list
    }
    func setSchoolScoreList(list:[SchoolScoresObject]){
        self.schoolScoreList = list
    }
    
    func setError(error:CustomNetworkError){
        self.error = error
    }
}
