struct Messages: Decodable {
    var count: Int;
    var items: [Message];
    var profiles: [MessageProfileInfo] = [];
}
