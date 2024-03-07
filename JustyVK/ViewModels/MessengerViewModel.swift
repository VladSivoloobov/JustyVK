import Foundation

class MessengerViewModel: ObservableObject{
    
    init(userId: Int) {
        self.userId = userId;
        startConversationPolling();
        debugConversations();
    }
    
    @Published var messageList: [Message] = [];
    @Published var userId: Int;
    
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
