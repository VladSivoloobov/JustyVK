public struct Friend: Decodable{
    var id: Int;
    var photo: String;
    var firstName: String;
    var lastName: String;
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case photo = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
