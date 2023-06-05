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
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(0..<dialogs.count, id: \.self){ index in
                        FriendRow(
                            name: dialogs.reversed()[index].name,
                            image: dialogs.reversed()[index].image
                        )
                        .overlay{
                            // TODO: Создать отдельный модификатор для этого
                            NavigationLink(
                                destination: {
                                    UserProfile(
                                        name: dialogs.reversed()[index].name,
                                        avatar: dialogs.reversed()[index].image
                                    )
                                        .onAppear(){
                                            self.tabBarVisibleBinding.toggle();
                                        }
                                        .onDisappear(){
                                            withAnimation(.spring()){
                                                self.tabBarVisibleBinding.toggle();
                                            }
                                        }
                                }, label: {
                                    EmptyView()
                                }
                            )
                            .opacity(0)
                        }
                    }
                }
                .listSectionSeparator(.hidden)
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
                    Button{
                        // TODO: Добавить возможность сортировки друзей по алфавиту и по статусу онлайн
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
