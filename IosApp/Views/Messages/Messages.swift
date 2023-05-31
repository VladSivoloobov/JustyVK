//
//  Messages.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Messages: View {
    @State var searchString = "";
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(dialogs){ dialog in
                        MessageRow(
                            lastMessage: dialog.lastMessage,
                            messageAutor: dialog.name,
                            isOnline: dialog.isOnline,
                            avatar: dialog.image
                        )
                        .overlay{
                            NavigationLink(
                                destination: DialogPage(name: dialog.name, image: dialog.image), label: {EmptyView()}
                            )
                            .opacity(0)
                        }
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .searchable(
                text: $searchString,
                prompt: "Поиск по сообщениям"
            )
            .toolbarBackground(.visible, for: .tabBar)
            .navigationTitle("Сообщения")
        }
    }
    
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
