//
//  LandingPage.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import SwiftUI

struct LandingPage: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: .listScreen)
            
                .navigationDestination(for: myPage.self) { page in
                    coordinator.getPage(page: page)
                }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
