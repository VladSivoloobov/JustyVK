//
//  IosAppApp.swift
//  IosApp
//
//  Created by Vladislav on 26.05.2023.
//

import SwiftUI

@main
struct AppInstance: App {
    @StateObject var userInfo = UserInfo();
    @StateObject var globalUIStates = GlobalUIStates();
    
    init(){
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Отмена"
    }
    
    var body: some Scene {
        WindowGroup {
            if(userInfo.token.isEmpty){
                Login()
                    .environmentObject(userInfo)
            } else{
                ContentView()
                    .environmentObject(userInfo)
                    .environmentObject(globalUIStates)
            }
        }
    }
}
