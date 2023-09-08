//
//  NYSchoolsApp.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import SwiftUI

@main
struct NYSchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            LandingPage().environmentObject(Coordinator())
        }
    }
}
