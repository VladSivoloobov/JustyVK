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
    
    init(id: Int? = nil, date: Int, peerId: Int? = nil, fromId: Int, text: String, randomId: Int? = nil, ref: String? = nil, refSource: String? = nil, attachments: [Attachment], important: Bool? = nil, payload: String? = nil, replyMessage: Message? = nil) {
        self.id = id
        self.date = date
        self.peerId = peerId
        self.fromId = fromId
        self.text = text
        self.randomId = randomId
        self.ref = ref
        self.refSource = refSource
        self.attachments = attachments
        self.important = important
        self.payload = payload
        self.replyMessage = replyMessage
    }
    
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
