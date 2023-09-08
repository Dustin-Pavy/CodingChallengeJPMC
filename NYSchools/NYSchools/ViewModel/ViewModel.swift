//
//  ViewModel.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import Foundation

enum ViewStates{
    case loading
    case errorState
    case loaded
    case emptyView
}

@MainActor
class ViewModel: ObservableObject{
    @Published var schoolInfoList = [SchoolObject]()
    @Published var schoolScoresList = [SchoolScoresObject]()
    @Published var schoolInfoListFiltered: [SchoolObject] = []
    
    @Published var customError: CustomNetworkError?
    
    @Published private(set) var viewState:ViewStates = .emptyView
    
    @Published var noSpecificScoreFound:Bool = false
    
    var repository:SchoolRepositoryAction
    init(repository:SchoolRepositoryAction){
        self.repository = repository
    }
    
    func getListsFromApi() async{
        viewState = .loading
        
        do{
            //api calls
            let results1 = try await self.repository.getSchoolInfoList()
            let results2 = try await self.repository.getSchoolScoresList()
            
            //if results are recieved set stored variables. Set view state accordingly
            if results1.isEmpty || results2.isEmpty{
                self.viewState = .emptyView
            } else{
                self.schoolInfoList = results1
                self.schoolInfoListFiltered = results1
                self.schoolScoresList = results2
                viewState = .loaded
            }
        }catch let error{
            switch error{
            case is DecodingError:
                customError = CustomNetworkError.parsingFailed
            case is URLError:
                customError = CustomNetworkError.invalidURL
            case CustomNetworkError.dataNotFound:
                customError = CustomNetworkError.dataNotFound
            case CustomNetworkError.invalidResponse:
                customError = CustomNetworkError.invalidResponse
            case CustomNetworkError.invalidURL:
                customError = CustomNetworkError.invalidURL
            case CustomNetworkError.parsingFailed:
                customError = CustomNetworkError.parsingFailed
            default:
                customError = CustomNetworkError.dataNotFound
            }
        }
        
    }
    
    func filterSchoolList(text: String){
        guard !text.isEmpty else{
            schoolInfoListFiltered = schoolInfoList
            return
        }
        
        schoolInfoListFiltered = schoolInfoList.filter{
            let nameMatch = $0.school_name.localizedCaseInsensitiveContains(text)
            return nameMatch
        }
    }
    
    func getSchoolScoresObject( schoolObj: SchoolObject) -> SchoolScoresObject{
        let filteredScores = schoolScoresList.filter{
            $0.dbn.localizedCaseInsensitiveContains(schoolObj.dbn!.lowercased())
        }
        if filteredScores.first != nil{
            return filteredScores.first!
        }else{
            noSpecificScoreFound = true
            return SchoolScoresObject(dbn: "", school_name: "No Data Found", num_of_sat_test_takers: "", sat_critical_reading_avg_score: "", sat_math_avg_score: "", sat_writing_avg_score: "")
        }
        
    }
    
}
