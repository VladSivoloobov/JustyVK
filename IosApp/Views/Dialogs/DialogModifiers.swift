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
    var companionId: Int;
    @Binding var tabBarVisibleBinding: Bool;
    @Binding var userName: String?;
    @Binding var avatar: String?;
    var onlineStatusVisible: Bool;
    
    func body(content: Content) -> some View{
        content
            .overlay{
            NavigationLink(
                destination: {
                    MessageList(name: userName ?? "Неизвестно", image: avatar ?? defaultImage, companionId: companionId, onlineStatusVisible: onlineStatusVisible)
                        .onAppear(){
                            self.tabBarVisibleBinding.toggle();
                        }
                        .onDisappear(){
                            withAnimation(.spring()){
                                self.tabBarVisibleBinding.toggle();
                            }
                        }
                        .onAppear(){
                            
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
    @Binding var unreadMessagesCount: Int;
    
    func body(content: Content) -> some View {
        content
            .onAppear(){
                SwiftVK(token: userInfo.token).messages.getConversations(offset: nil, count: 200, filter: nil, extended: nil, fields: "[id, ]", groupId: nil){
                    conversationsList in
                    conversations = conversationsList.items;
                    unreadMessagesCount = conversationsList.unreadCount;
                }
            }
    }
}

extension View {
    func dialogOverlay(dialog: Conversation, tabBarVisibleBinding: Binding<Bool>, companionId: Int, userName: Binding<String?>, avatar: Binding<String?>, onlineStatusVisible: Bool) -> some View{
        modifier(DialogOverlay(dialog: dialog, companionId: companionId, tabBarVisibleBinding: tabBarVisibleBinding, userName: userName, avatar: avatar, onlineStatusVisible: onlineStatusVisible))
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
    
    func getConversations(_ conversationList: Binding<[ConversationInfo]>, _ unreadMessagesCount: Binding<Int>) -> some View{
        modifier(GetConversations(conversations: conversationList, unreadMessagesCount: unreadMessagesCount));
    }
}
