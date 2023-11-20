//
//  CPB_FirebaseApp.swift
//  CPB_Firebase
//
//  Created by Ben Wojtowicz on 11/20/23.
//

import SwiftUI
import FirebaseCore

@main
struct CPB_FirebaseApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

