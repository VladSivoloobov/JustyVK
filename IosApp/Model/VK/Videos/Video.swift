import Foundation;

struct Video: Decodable{
    var id: Int;
    var ownerId: Int;
    var title: String?;
    var description: String?;
    var duration: Int;
    var image: [VideoImage]?;
    var firstFrame: [VideoImage]?;
    var date: Int;
    var addingDate: Int?;
    var views: Int;
    var localViews: Int?;
    var comments: Int?;
    var player: String?;
    var platform: String?;
    var canAdd: Int;
    var isPrivate: Int?;
    var accessKey: String?;
    var processing: Int?;
    var canAttachLink: Int?;
    var width: Int?;
    var height: Int?;
    var userId: Int?;
    var converting: Int?;
    var added: Int?;
    var isSubscribed: Int?;
    
    //TODO: Разобраться с этим свойством repeat
    var repeatedVideo: Int?;
    var type: String;
    var balance: Int?;
    var live: Int?;
    var liveStartTime: Int?;
    var liveStatus: String?;
    var upcoming: Int?;
    var spectators: Int?;
    var likes: Int?;
    
    enum CodingKeys: String, CodingKey{
        case id = "id";
        case ownerId = "owner_id";
        case title = "title";
        case description = "description";
        case duration = "duration";
        case image = "image";
        case firstFrame = "first_frame";
        case date = "date";
        case addingDate = "adding_date";
        case views = "views";
        case localViews = "local_views";
        case comments = "comments";
        case player = "player";
        case platform = "platform";
        case canAdd = "can_add";
        case isPrivate = "is_private";
        case accessKey = "access_key";
        case processing = "processing";
        case canAttachLink = "can_attach_link";
        case width = "width";
        case height = "height";
        case userId = "user_id";
        case converting = "converting";
        case added = "added";
        case isSubscribed = "is_subscribed";
        case repeatedVideo = "repeat";
        case type = "type";
        case balance = "balance";
        case live = "live";
        case liveStartTime = "live_start_time";
        case liveStatus = "live_status";
        case upcoming = "upcoming";
        case spectators = "spectators";
        case likes = "likes";
    }
    
    struct VideoImage: Decodable{
        var height: Int;
        var url: String;
        var width: Int;
        var withPadding: Int?;
        
        enum CodingKeys: String, CodingKey{
            case height = "height";
            case url = "url";
            case withPadding = "with_padding";
            case width = "width";
        }
    }
}
