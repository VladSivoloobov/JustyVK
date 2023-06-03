//
//  ContentView.swift
//  IosApp
//
//  Created by Vladislav on 26.05.2023.
//

import SwiftUI

enum Tabs: String{
    case friends = "Друзья";
    case messages = "Сообщения";
    case settings = "Настройки"
}

struct ContentView: View {
    @State private var selectedTab: Tabs = .messages;
    @State var tabBarIsHidden: Bool = false;
    
    var body: some View {
        TabView(selection: $selectedTab){
            Friends()
                .tabItem{
                    Image(systemName: "person.2.fill")
                    Text("Друзья")
                }
                .tag(Tabs.friends)
            Messages(tabBarVisibleBinding: $tabBarIsHidden)
                .tabItem{
                    Image(systemName: "message")
                    Text("Сообщения")
                }
                .tag(Tabs.messages)
                .toolbar(tabBarIsHidden ? .hidden : .visible, for: .tabBar)
            Settings()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Настройки")
                }
                .tag(Tabs.settings)
        }
        .zIndex(-1)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
