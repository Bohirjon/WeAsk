//
//  WeAskApp.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import SwiftUI
import Firebase

@main
struct WeAskApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
