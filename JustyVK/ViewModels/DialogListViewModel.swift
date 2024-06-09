import Foundation

class DialogListViewModel: ObservableObject{
    init(isPreview: Bool = false) {
        if(isPreview){
            debugConversations();
            return;
        }
        getConversations();
    }
    
    @Published var conversations: [ConversationInfo] = [];
    @Published var unreadMessagesCount: Int = 0;
    @Published var profileList: [ExtendedInfo] = [];
    
    func getConversations(){
        SwiftVKSingletone.shared.messages.getConversations(offset: nil, count: 200, filter: nil, extended: 1, fields: "photo_50, photo_100, sex, screen_name, online_info, online", groupId: nil){
            conversationsList in
            self.conversations = conversationsList.items;
            self.unreadMessagesCount = conversationsList.unreadCount ?? 0;
            self.profileList = conversationsList.profiles;
        }
    }
    
    func debugConversations(){
        conversations = [
            ConversationInfo(
                conversation: Conversation(
                    peer: Conversation.ConversationPeer(
                        id: 120,
                        type: ConversationType.user,
                        localId: 123
                    ),
                    inRead: 1,
                    outRead: 123,
                    important: false,
                    canWrite: CanWrite(
                        allowed: true
                    ),
                    chatSettings: ChatSettings(
                        membersCount: 0,
                        state: ChatState.inChat,
                        photo: ChatPhoto(
                            photo50: "Avatar",
                            photo100: "Avatar",
                            photo200: "Avatar"
                        ),
                        activeIds: [12, 21, 32],
                        isGroupChannel: false
                    )
                ),
                lastMessage: Message(
                    date: 324234,
                    fromId: 234234,
                    text: "Привет",
                    attachments: []
                ))
        ]
    }
}
