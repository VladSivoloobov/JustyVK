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
    @EnvironmentObject var userInfo: UserInfo;
    @State var unreadMessagesCounter: Int = 0;
    
    var body: some View {
        // TODO: Сделать кастомный таббар
        TabView(selection: $selectedTab){
            FriendList(tabBarVisibleBinding: $tabBarIsHidden)
                .tabItem{
                    Image(systemName: "person.2.fill")
                    Text("Друзья")
                }
                .tag(Tabs.friends)
            DialogList(tabBarVisibleBinding: $tabBarIsHidden, unreadMessagesCount: $unreadMessagesCounter)
                .tabItem{
                    Image(systemName: "message")
                    Text("Сообщения")
                }
                .badge(unreadMessagesCounter)
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
        .onAppear(){
            SwiftVK(token: userInfo.token).users.get(userId: nil){
                users in
                userInfo.firstName = users[0].firstName;
                userInfo.lastName = users[0].lastName;
                userInfo.id = users[0].id;
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(unreadMessagesCounter: 20)
    }
}
