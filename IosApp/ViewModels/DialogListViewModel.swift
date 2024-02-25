import Foundation

class DialogListViewModel: ObservableObject{
    init() {
        getConversations();
    }
    
    @Published var conversations: [ConversationInfo] = [];
    @Published var unreadMessagesCount: Int = 0;
    
    func getConversations(){
        SwiftVKSingletone.shared.messages.getConversations(offset: nil, count: 200, filter: nil, extended: nil, fields: "[id, ]", groupId: nil){
            conversationsList in
            self.conversations = conversationsList.items;
            self.unreadMessagesCount = conversationsList.unreadCount;
        }
    }
}
