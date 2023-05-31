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
    
    var body: some View {
        TabView(selection: $selectedTab){
            Friends().tabItem{
                Image(systemName: "person.crop.circle")
                Text("Друзья")
            }
            .tag(Tabs.friends)
            Messages().tabItem{
                Image(systemName: "message")
                Text("Сообщения")
            }
            .tag(Tabs.messages)
            Settings().tabItem{
                Image(systemName: "gear")
                Text("Настройки")
            }
            .tag(Tabs.settings)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
