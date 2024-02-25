struct PinnedMessage: Decodable{
    var id: Int;
    var date: Int;
    var fromId: Int;
    var attachments: [Attachment];
    var conversationMessageId: Int;
    var peerId: Int;
    var text: String;
    
    enum CodingKeys: String, CodingKey{
        case id;
        case date;
        case fromId = "from_id";
        case attachments;
        case conversationMessageId = "conversation_message_id";
        case peerId = "peer_id";
        case text;
    }
}
