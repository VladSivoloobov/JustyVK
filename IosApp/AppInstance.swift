//
//  IosAppApp.swift
//  IosApp
//
//  Created by Vladislav on 26.05.2023.
//

import SwiftUI

// TODO: Переименовать все структуры на нормальные названия

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
