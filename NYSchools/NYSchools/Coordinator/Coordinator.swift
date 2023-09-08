//
//  Coordinator.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject{
    
    @Published var path = NavigationPath()
    
    var schoolObject: SchoolObject?
    var schoolScoreObject: SchoolScoresObject?
    var noScoreInfo: Bool?
    
    func showLandingPage(){
        path.append(myPage.landingScreen)
    }

    func showListPage(){
        path.append(myPage.listScreen)
    }

    func showDetailPage(infoObject: SchoolObject, scoreObject:SchoolScoresObject, noScore: Bool){
        self.noScoreInfo = noScore
        self.schoolObject = infoObject
        self.schoolScoreObject = scoreObject
        path.append(myPage.detailScreen)
    }
    
    
    @ViewBuilder
    func getPage(page: myPage) -> some View{
        switch page{
            
        case .landingScreen:
            LandingPage()
        case .listScreen:
            ContentView().environmentObject(self)
        case .detailScreen:
            DetailView(schoolInfo: self.schoolObject!, schoolScores: self.schoolScoreObject!, noScoreInfo: self.noScoreInfo!)
        }
    }
    
}

enum myPage: String, CaseIterable, Identifiable{
    case landingScreen
    case listScreen
    case detailScreen
    
    var id:String{self.rawValue}
}
