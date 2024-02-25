public struct Photo: Decodable{
    var id: Int;
    var albumId: Int;
    var ownerId: Int;
    var text: String;
    var date: Int;
    var sizes: [PhotoSize];
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case albumId = "album_id"
        case ownerId = "owner_id"
        case text = "text"
        case date = "date"
        case sizes = "sizes"
    }
    
    struct PhotoSize: Decodable{
        var type: String;
        var url: String;
        var width: Int;
        var height: Int;
    }
}
