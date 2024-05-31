//
//  RememberMeApp.swift
//  RememberMe
//
//  Created by user256510 on 5/1/24.
//

import SwiftUI
import SwiftData

@main
struct RememberMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Pic.self)
    }
}
