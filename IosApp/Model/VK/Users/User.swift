import Foundation

struct User: Decodable{
    var uuid = UUID();
    var id: Int;
    var firstName: String;
    var lastName: String;
    var deactivated: String?;
    var isClosed: Bool;
    var canAccessClosed: Bool;
    // Optional
    var about: String?;
    var activities: String?;
    var bdate: String?;
    var blackListed: Int?;
    var blackListedByMe: Int?;
    var canSendFriendRequest: Int?;
    var canWritePrivateMessage: Int?;
    var city: City?;
    var commonCount: Int?;
    var contacts: Contacts?;
    var country: Country?;
    var domain: String?;
    var friendStatus: Int?;
    var online: Int?;
    var onlineMobile: Int?;
    var onlineApp: Int?;
    var screenName: String?;
    var sex: Int?;
    var status: String?;
    var verified: Int?;
    var photo100: String?;
    var lastSeen: LastSeen?;
    
    struct LastSeen: Decodable{
        var platform: Int;
        var time: Int;
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case deactivated = "deactivated"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case about = "about"
        case activities = "activities"
        case bdate = "bdate"
        case blackListed = "black_listed"
        case blackListedByMe = "black_listed_by_me"
        case canSendFriendRequest = "can_send_friend_request"
        case canWritePrivateMessage = "can_write_private_message"
        case city = "city"
        case commonCount = "common_count"
        case contacts = "contacts"
        case country = "country"
        case domain = "domain"
        case friendStatus = "friend_status"
        case online = "online"
        case onlineMobile = "online_mobile"
        case onlineApp = "online_app"
        case screenName = "screen_name"
        case sex = "sex"
        case status = "status"
        case verified = "verified"
        case photo100 = "photo_100"
        case lastSeen = "last_seen"
    }
    
    struct OnlineTime: Decodable{
        var time: Int;
        var platform: Int;
    }

    struct Contacts: Decodable{
        var mobilePhone: String;
        var homePhone: String;

        enum CodingKeys: String, CodingKey {
            case mobilePhone = "mobile_phone"
            case homePhone = "home_phone"
        }
    }

    struct Country: Decodable{
        var id: Int;
        var title: String;
    }

    struct City: Decodable{
        var id: Int;
        var title: String;
    }
}
