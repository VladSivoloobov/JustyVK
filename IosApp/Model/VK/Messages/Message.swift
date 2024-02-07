class Message: Decodable{
    var id: Int?;
    var date: Int;
    var peerId: Int?;
    var fromId: Int;
    var text: String;
    var randomId: Int?;
    var ref: String?;
    var refSource: String?;
    var attachments: [Attachment];
    var important: Bool?;
    var payload: String?;
    var replyMessage: Message?;
    
    enum CodingKeys: String, CodingKey {
        case id = "id";
        case date = "date";
        case peerId = "peer_id";
        case fromId = "from_id";
        case text = "text";
        case randomId = "random_id";
        case ref = "ref";
        case refSource = "ref_source";
        case attachments = "attachments";
        case important = "important";
        case payload = "payload";
        case replyMessage = "reply_message";
    }
}
