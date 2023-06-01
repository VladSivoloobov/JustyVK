//
//  Messages.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Messages: View {
    @State var searchString = "";
    @State var viewWidth = CGFloat.zero
    
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
                        .contextMenu{
                            Button {
                                
                            } label: {
                                Label("Закрепить", systemImage: "pin")
                            }
                            Button {
                                
                            } label: {
                                Label("Отключить уведомления", systemImage: "bell.slash")
                            }
                            Button {
                                
                            } label: {
                                Label("Добавить в архив", systemImage: "archivebox")
                            }
                            Button{
                                
                            } label: {
                                Label("Добавить в избранное", systemImage: "star")
                            }
                            Button(role: .destructive){
                                
                            } label: {
                                Label("Удалить", systemImage: "trash")
                                    .foregroundColor(.red)
                            }
                        } preview: {
                            DialogPage(name: dialog.name, image: dialog.image)
                                .frame(minWidth: 0, idealWidth: 500, maxWidth: 500, minHeight: 0, idealHeight: 500, maxHeight: 500, alignment: .center)
                        }
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
            .listStyle(.plain)
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
