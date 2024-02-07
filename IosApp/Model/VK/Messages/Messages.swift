struct Messages: Decodable {
    var count: Int;
    var items: [Message];
    
    enum CodingKeys: String, CodingKey{
        case items = "items";
        case count = "count";
    }
}
