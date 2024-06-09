struct ConversationInfo: Decodable {
    var conversation: Conversation;
    var lastMessage: Message;
    
    enum CodingKeys: String, CodingKey{
        case lastMessage = "last_message";
        case conversation;
    }
}

struct Conversation: Decodable{
    struct ConversationPeer: Decodable{
        var id: Int;
        var type: ConversationType;
        var localId: Int;
        
        enum CodingKeys: String, CodingKey{
            case id;
            case type;
            case localId = "local_id";
        }
    }
    
    var peer: ConversationPeer;
    var inRead: Int;
    var outRead: Int;
    var unreadCount: Int?;
    var important: Bool;
    var pushSettings: PushSettings?;
    var canWrite: CanWrite;
    var chatSettings: ChatSettings?;
    
    enum CodingKeys: String, CodingKey{
        case peer;
        case inRead = "in_read";
        case outRead = "out_read";
        case unreadCount = "unread_count";
        case important;
        case pushSettings = "push_settings";
        case canWrite = "can_write";
        case chatSettings = "chat_settings";
    }
}

enum ConversationType: String, Decodable {
    case user;
    case chat;
    case email;
    case group;
}
