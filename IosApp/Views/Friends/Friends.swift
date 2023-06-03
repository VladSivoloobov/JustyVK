//
//  Friends.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Friends: View {
    @State var searchableFriendsText: String = "";
    
    var body: some View {
        NavigationStack{
            Section{
                List{
                    ForEach(0..<dialogs.count, id: \.self){ index in
                        FriendRow(name: dialogs[index].name, image: dialogs[index].image)
                    }.listSectionSeparator(.hidden)
                }
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
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
