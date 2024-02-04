//
//  DialogList.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct DialogList: View {
    @State var searchString = "";
    @State var viewWidth = CGFloat.zero;
    @Binding var tabBarVisibleBinding: Bool;
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(dialogs){ dialog in
                        DialogRow(
                            lastMessage: dialog.lastMessage,
                            messageAutor: dialog.name,
                            isOnline: dialog.isOnline,
                            avatar: dialog.image,
                            isReaded: dialog.isReaded,
                            unreadCount: dialog.unreadCount
                        )
                        .swipeActions{
                            Button(role: .destructive) {
                                // TODO: Добавить экшн баттон для удаления
                            } label: {
                                Label("Добавить в архив", systemImage: "trash")
                            }
                        }
                        .contextMenu{
                            Button {
                                // TODO: Добавить контекстную кнопку закреления
                            } label: {
                                Label("Закрепить", systemImage: "pin")
                            }
                            Button {
                                // TODO: Добавить контекстную кнопку отключения уведомлений
                            } label: {
                                Label("Отключить уведомления", systemImage: "bell.slash")
                            }
                            Button {
                                // TODO: Добавить кнопку добавления в архив
                            } label: {
                                Label("Добавить в архив", systemImage: "archivebox")
                            }
                            Button{
                                // TODO: Добавить кнопку добавления в избранное
                            } label: {
                                Label("Добавить в избранное", systemImage: "star")
                            }
                            Button(role: .destructive){
                                // TODO: Добавить кнопку удаления
                            } label: {
                                Label("Удалить", systemImage: "trash")
                                    .foregroundColor(.red)
                            }
                        } preview: {
                            MessageList(name: dialog.name, image: dialog.image)
                                .frame(minWidth: 0, idealWidth: 500, maxWidth: 500, minHeight: 0, idealHeight: 500, maxHeight: 500, alignment: .center)

                        }
                        .overlay{
                            // TODO: Создать отдельный модификатор для этого
                            NavigationLink(
                                destination: {
                                    MessageList(name: dialog.name, image: dialog.image)
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
            .environment(\.defaultMinListRowHeight, 80)
            .listStyle(.plain)
            .searchable(
                text: $searchString,
                prompt: "Поиск по сообщениям"
            )
            .toolbarBackground(.visible, for: .tabBar)
            .navigationTitle("Сообщения")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        // TODO: Здесь нужно сделать работающей кнопку архива, в нём будет список чатов, которые пользователь скрыл
                    } label: {
                        Image(systemName: "archivebox.fill")
                    }
                    Button{
                        // TODO: Здесь нужно сделать кнопку с закладкам, закладка это любой чат, пользователь или контент, который был помечен, как "закладка"
                    } label: {
                        Image(systemName: "bookmark.fill")
                    }
                }
            }
        }
    }
}

#Preview{
    DialogList(searchString: "", viewWidth: CGFloat.zero, tabBarVisibleBinding: .constant(false))
}
