//
//  IosAppApp.swift
//  IosApp
//
//  Created by Vladislav on 26.05.2023.
//

import SwiftUI

@main
struct AppInstance: App {
    init(){
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Отмена"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
