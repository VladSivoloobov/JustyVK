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
                Section(){
                    ForEach(friendList, id: \.uuid){ friend in
                        FriendRow(
                            name: friend.firstName + " " + friend.lastName,
                            image: friend.photo100!,
                            lastSeenTime: friend.lastSeen?.time ?? -404,
                            lastSeenPlatform: friend.lastSeen?.platform ?? -404,
                            sex: friend.sex!,
                            isOnline:friend.online!,
                            user: friend,
                            tabBarVisibleBinding: $tabBarVisibleBinding
                        )
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .onAppear{
                if(friendList.count > 0){
                    return;
                }
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
                    self.friendList = filterFriendsByOnline(friends: friends);
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
                        Section("Сортировка"){
                            Button("Сначала онлайн"){
                                withAnimation{
                                    friendList = filterFriendsByOnline(friends: friendList);
                                }
                            }
                            Button("По алфавиту"){
                                withAnimation{
                                    friendList = friendList.sorted{$0.firstName < $1.firstName};
                                }
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
    
    func filterFriendsByOnline(friends: [User]) -> [User]{
        let onlineFriends = friends.filter{ friend in
            return friend.online == 1
        }
        
        let offlineFriends = friends.filter{ friend in
            return friend.online != 1;
        }
        
        return onlineFriends + offlineFriends;
    }
}

struct FriendList_Previews: PreviewProvider {
    static var previews: some View {
        FriendList(tabBarVisibleBinding: .constant(true))
    }
}
