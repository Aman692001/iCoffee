//
//  iCoffeeApp.swift
//  iCoffee
//
//  Created by Aman on 14/05/23.
//

import SwiftUI
import UIKit

// this is an AppDelegate


//This is an SceneDelegate

@main
struct iCoffeeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
