//
//  DogEncyclopediaApp.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

@main
struct DogEncyclopediaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            StartingView()
        }
    }
}
