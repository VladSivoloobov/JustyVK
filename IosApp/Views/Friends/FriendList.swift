//
//  Friends.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct FriendList: View {
    @State var searchableFriendsText: String = "";
    //TODO: Вынести этот биндинг отдельно куда-нибудь
    @Binding var tabBarVisibleBinding: Bool;
    @EnvironmentObject var userInfo: UserInfo;
    @State var friendList = [User]()
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(0..<friendList.count, id: \.self){ index in
                        FriendRow(
                            name: friendList[index].firstName + " " + friendList[index].lastName,
                            image: friendList[index].photo100!,
                            lastSeenTime: friendList[index].lastSeen?.time ?? -404,
                            lastSeenPlatform: friendList[index].lastSeen?.platform ?? -404,
                            sex: friendList[index].sex!,
                            isOnline: friendList[index].online!,
                            user: friendList[index],
                            tabBarVisibleBinding: $tabBarVisibleBinding
                        )
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .onAppear{
                let vk = SwiftVK(token: userInfo.token);
                vk.friends.get(
                    fields: [
                        "status",
                        "photo_100",
                        "screen_name",
                        "last_seen",
                        "sex",
                        "online"
                    ]
                ){ friends in
                    self.friendList = friends;
                }
            }
            .environment(\.defaultMinListRowHeight, 50)
            .listStyle(.plain)
            .searchable(
                text: $searchableFriendsText,
                prompt: "Поиск по друзьям"
                // TODO: Добавить возможность поиска друзей
            )
            .navigationTitle("Друзья")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Menu(){
                        // TODO: Добавить возможность сортировки друзей по алфавиту и по статусу онлайн
                        Section("Сортировка"){
                            Button("По дате посещения"){
                                // TODO: Сделать эту кнопку рабочей
                            }
                            Button("По алфавиту"){
                                // TODO: Сделать эту кнопку рабочей
                            }
                        }
                    } label: {
                        Label("Сортировка", systemImage: "arrow.up.arrow.down")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct FriendList_Previews: PreviewProvider {
    static var previews: some View {
        FriendList(tabBarVisibleBinding: .constant(true))
    }
}
