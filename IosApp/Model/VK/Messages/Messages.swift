struct Messages: Decodable {
    var count: Int;
    var items: [VKMesage];
    
    enum CodingKeys: String, CodingKey{
        case items = "items";
        case count = "count";
    }
}
