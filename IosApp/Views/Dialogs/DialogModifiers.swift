import SwiftUI

struct DialogContextMenu: ViewModifier{
    func body(content: Content) -> some View {
        content
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
        }
    }
}

struct DialogSwipeActions: ViewModifier{
    func body(content: Content) -> some View{
        content
            .swipeActions{
            Button(role: .destructive) {
                // TODO: Добавить экшн баттон для удаления
            } label: {
                Label("Добавить в архив", systemImage: "trash")
            }
        }
    }
}

struct DialogOverlay: ViewModifier{
    var dialog: Conversation;
    @Binding var tabBarVisibleBinding: Bool;
    
    func body(content: Content) -> some View{
        content
            .overlay{
            // TODO: Создать отдельный модификатор для этого
            NavigationLink(
                destination: {
                    MessageList(name: dialog.chatSettings?.title ?? "Тестовый Пользователь", image: dialogs[0].image, companionId: 2)
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

struct DialogModifiers: ViewModifier {
    var searchString: Binding<String>;
    func body(content: Content) -> some View {
        content
            .environment(\.defaultMinListRowHeight, 80)
            .listStyle(.plain)
            .searchable(
                text: searchString,
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

struct GetConversations: ViewModifier{
    @Binding var conversations: [ConversationInfo];
    @EnvironmentObject var userInfo: UserInfo;
    
    func body(content: Content) -> some View {
        content
            .onAppear(){
                SwiftVK(token: userInfo.token).messages.getConversations(offset: nil, count: nil, filter: nil, extended: nil, fields: "[id, ]", groupId: nil){
                    conversationsList in
                    conversations = conversationsList.items;
                }
            }
    }
}

extension View {
    func dialogOverlay(dialog: Conversation, tabBarVisibleBinding: Binding<Bool>) -> some View{
        modifier(DialogOverlay(dialog: dialog, tabBarVisibleBinding: tabBarVisibleBinding))
    }
    
    func dialogSwipeActions() -> some View{
        modifier(DialogSwipeActions())
    }
    
    func dialogContextMenu() -> some View{
        modifier(DialogContextMenu())
    }
    
    func dialogModifiers(_ searchString: Binding<String>) -> some View{
        modifier(DialogModifiers(searchString: searchString))
    }
    
    func getConversations(_ conversationList: Binding<[ConversationInfo]>) -> some View{
        modifier(GetConversations(conversations: conversationList));
    }
}
