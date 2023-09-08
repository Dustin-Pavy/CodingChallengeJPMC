//
//  Repository.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import Foundation

protocol SchoolRepositoryAction{
    func getSchoolInfoList() async throws -> [SchoolObject]
    func getSchoolScoresList() async throws -> [SchoolScoresObject]
}

class SchoolRepository{
    let networkManager:NetworkProtocol
    
    init(networkManager:NetworkProtocol){
        self.networkManager = networkManager
    }
    
}


extension SchoolRepository: SchoolRepositoryAction{
    
    func getSchoolScoresList() async throws -> [SchoolScoresObject] {
        
        do{
            let schoolScoresRequest = SchoolRequest(path: Endpoint.schoolScoresEndpoint)
            let data = try await networkManager.fetchData(from: schoolScoresRequest)
            let results = try JSONDecoder().decode([SchoolScoresObject].self, from: data)
            return results
        }catch{
            throw error
        }
    }
    
    func getSchoolInfoList() async throws -> [SchoolObject] {
        do{
            let schoolInfoRequest = SchoolRequest(path: Endpoint.schoolInfoEndpoint)
            let data = try await networkManager.fetchData(from: schoolInfoRequest)
            let results = try JSONDecoder().decode([SchoolObject].self, from: data)
            return results
        }catch{
            throw error
        }
    }
}

