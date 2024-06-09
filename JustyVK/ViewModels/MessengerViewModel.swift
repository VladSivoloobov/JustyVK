import Foundation

class MessengerViewModel: ObservableObject{
    
    init(userId: Int, companionId: Int) {
        self.userId = userId;
        self.companionId = companionId;
        startConversationPolling();
        getMessageList()
        debugConversations();
    }
    
    @Published var companionId: Int;
    @Published var messageList: [Message] = [];
    @Published var profilesList: [ExtendedInfo] = [];
    @Published var userId: Int;
    
    func getMessageList(){
        SwiftVKSingletone.shared.messages.getHistory(offset: nil,
                                                     count: nil,
                                                     userId: companionId,
                                                     peerId: nil,
                                                     rev: nil,
                                                     extended: 1,
                                                     //TODO: Изменить на перечисление
                                                     fields: "photo_50, photo_100, sex, screen_name, online_info, online",
                                                     groupId: nil){
            messages in
            self.messageList = messages.items;
            self.profilesList = messages.profiles;
    }
    }
    
    func startConversationPolling(){
        SwiftVK.SwiftVKMessages.SwiftVKLongPoll.addEventListener(event: .newMessage){
            messageEvent in
            if let messageEvent = messageEvent as? NewMessageEvent{
                if(messageEvent.peerId != self.userId){
                    return;
                }
                
                let newMessage = Message(
                    date: messageEvent.timestamp,
                    fromId: Int(messageEvent.attachments?.from ?? "0")!,
                    text: messageEvent.text,
                    attachments: []
                );
                
                print(newMessage);
                
                self.messageList.insert(newMessage, at: 0);
            }
        }
    }
    
    func stopConversationPolling(){
        
    }
    
    func debugConversations(){
        SwiftVK.SwiftVKMessages.SwiftVKLongPoll.addEventListener(event: .newMessage){
            messageEvent in
            if let messageEvent = messageEvent as? NewMessageEvent{
                print(messageEvent.text);
            }
        }
    }
}
