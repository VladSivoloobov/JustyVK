import Foundation

struct Conversations: Decodable {
    var count: Int;
    var unreadCount: Int?;
    var items: [ConversationInfo];
    var profiles: [ExtendedInfo]
    
    enum CodingKeys: String, CodingKey {
        case count;
        case unreadCount = "unread_count";
        case items;
        case profiles;
    }
}
