struct VKGroup: Decodable{
    var id: Int;
    var name: String;
    var screenName: String;
    var isClosed: Int;
    var type: String;
    var isAdmin: Int;
    var isMember: Int;
    var isAdvertiser: Int;
    var photo50: String;
    var photo100: String;
    var photo200: String;
    
    enum CodingKeys: String, CodingKey{
        case id;
        case name;
        case screenName = "screen_name";
        case isClosed = "is_closed";
        case type;
        case isAdmin = "is_admin";
        case isMember = "is_member";
        case isAdvertiser = "is_advertiser";
        case photo50 = "photo_50";
        case photo100 = "photo_100";
        case photo200 = "photo_200";
    }
}
