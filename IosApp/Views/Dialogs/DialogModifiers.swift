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
    @ObservedObject var dialogInfo: DialogInfo;
    @EnvironmentObject var globalUIStates: GlobalUIStates;
    
    func body(content: Content) -> some View{
        content
            .overlay{
            NavigationLink(
                destination: {
                    MessageList(dialogInfo: dialogInfo)
                        .onAppear(){
                            //TODO: Место переключения таббара - выкл
                            globalUIStates.tabBarVisible.toggle();
                        }
                        .onDisappear(){
                            withAnimation(.spring()){
                                //TODO: Место переключения таббара - вкл
                                globalUIStates.tabBarVisible.toggle();
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
                ToolbarItemGroup(placement: .topBarLeading){
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
                SwiftVKSingletone.shared.messages.getConversations(offset: nil, count: 200, filter: nil, extended: nil, fields: "[id, ]", groupId: nil){
                    conversationsList in
                    conversations = conversationsList.items;
                    unreadMessagesCount = conversationsList.unreadCount;
                }
            }
    }
}

extension View {
    func dialogOverlay(dialogInfo: DialogInfo) -> some View{
        modifier(DialogOverlay(dialogInfo: dialogInfo))
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
