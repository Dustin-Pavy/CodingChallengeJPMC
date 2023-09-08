//
//  ContentView.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import SwiftUI

enum FeatureState{
    case active
    case inactive
}

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @StateObject var viewModel = ViewModel(repository: SchoolRepository(networkManager: NetworkManager()))
    
    @State var searchText = ""
    
    var linearGradientColors = [Color.white, Color(hex: "34859d", alpha: 1)]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: linearGradientColors, startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                switch viewModel.viewState{
                case .loaded:
                    if(viewModel.schoolInfoListFiltered.isEmpty){
                        Text("Nothing found!")
                    }else{
                        List(viewModel.schoolInfoListFiltered){ info in
                            ZStack(alignment: .center){
                                Text(info.school_name)
                                    .multilineTextAlignment(.center)
                                    .onTapGesture {
                                        let obj = viewModel.getSchoolScoresObject(schoolObj: info)
                                        
                                        if(viewModel.noSpecificScoreFound){
                                            coordinator.showDetailPage(infoObject: info, scoreObject: obj, noScore: true)
                                            viewModel.noSpecificScoreFound = false
                                        }else{
                                            coordinator.showDetailPage(infoObject: info, scoreObject: obj, noScore: false)
                                        }
                                    }
                            }
                            .listRowBackground(Color.clear)
                        }
                        .padding(.top, 1.0)
                        .background(Color.clear)
                        .scrollContentBackground(.hidden)
                    }
                case .loading:
                    ProgressView()
                case .emptyView:
                    Text("no info...")
                case .errorState:
                    Text("Something went wrong...")
                }
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, perform: { newValue in
            viewModel.filterSchoolList(text: newValue)
        })
        .refreshable {
            Task{
                await viewModel.getListsFromApi()
            }
        }
        .toolbarBackground(.hidden)
        .navigationBarTitle("Schools List", displayMode: .inline)
        .task {
            if viewModel.schoolInfoList.count > 0 {
                return
            }
            await viewModel.getListsFromApi()
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
