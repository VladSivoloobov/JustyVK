import Alamofire
import Foundation

public struct SwiftVK {
    public let token: String;
    public let friends: SwiftVKFriends;
    public let users: SwiftVKUsers;
    public let messages: SwiftVKMessages;
    public let photos: SwiftVKPhotos;
    
    public init(token: String) {
        self.token = token
        self.friends = SwiftVKFriends(token: token)
        self.users = SwiftVKUsers(token: token)
        self.messages = SwiftVKMessages(token: token)
        self.photos = SwiftVKPhotos(token: token)
    }
    
    public static func createLastSeenString(lastSeenTime: Int?, isOnline: Int?, sex: Int?) -> String{
        if(lastSeenTime == nil || isOnline == nil || sex == nil){
            return "Неизвестно";
        }
        var lastSeenString = "";
        if(isOnline == 1){
            lastSeenString = "в сети";
            return lastSeenString;
        }
        
        switch(sex){
        case 1:
            lastSeenString = "была "
            break;
        case 2:
            lastSeenString = "был "
            break;
        default:
            lastSeenString = "был(а) "
            break;
        }
        
        if(lastSeenTime == -404){
            lastSeenString += "недавно";
            return lastSeenString;
        }
        
        let calendar = Calendar(identifier: .gregorian);
        let date = Date(timeIntervalSince1970: TimeInterval(lastSeenTime!));
        let daysDifference = calendar.numberOfDaysBetween(date);
        lastSeenString += calendar.getLastOnlineDateString(difference: daysDifference, date: date);
        return lastSeenString;
    }
    
    public struct SwiftVKUsers{
        private let url = "https://api.vk.com/method/users.get"
        public let token: String;
        
        func get(userId: Int?, fields: [String] = [""], completion: @escaping ([User]) -> ()){
            let url = "https://api.vk.com/method/users.get";
            let params: Parameters = filterParams(params: [
                "access_token": token,
                "user_ids": userId ?? "",
                "fields": fields.joined(separator: ","),
                "v": "5.131",
            ]);
            
            fetchData(url: url, method: .post, parameters: params){
                (messages: Response<[User]>?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response);
                }
            }
        }
    }
    
    public struct SwiftVKMessages{
        public let token: String;
        
        func getHistory(offset: Int?,
                        count: Int?,
                        userId: Int?,
                        peerId: Int?,
                        rev: Int?,
                        extended: Int?,
                        fields: String?,
                        groupId: Int?,
                        completion: @escaping ([Message]) -> ()){
            let url = "https://api.vk.com/method/messages.getHistory"
            let params: Parameters = [
                "access_token": token,
                "user_id": userId ?? "",
                "peer_id": peerId ?? "",
                "rev": rev ?? "",
                "extended": extended ?? "",
                "fields": fields ?? "",
                "group_id": groupId ?? "",
                "count": count ?? 200,
                "v": "5.131"
            ]
            
            fetchData(url: url, method: .post, parameters: params){
                (messages: Response<Messages>?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response.items);
                }
            }
        }
        
        func getConversations(offset: Int?, count: Int?, filter: String?, extended: Int?, fields: String?, groupId: Int?, completion: @escaping (Conversations) -> ()){
            let url = "https://api.vk.com/method/messages.getConversations";
            let params: Parameters = filterParams(params: [
                "access_token": token,
                "count": count ?? "",
                "filter": filter ?? "",
                "extended": extended ?? "",
                "fields": fields ?? "",
                "groupId": groupId ?? "",
                "v": "5.131"
            ]);
            
            fetchData(url: url, method: .post, parameters: params){
                (conversations: Response<Conversations>?) in
                if let fetchedConversations = conversations {
                    completion(fetchedConversations.response);
                }
            }
        }
        
        func getLastActivity(userId: Int, completion: @escaping (LastActivity?) -> ()){
            let url = "https://api.vk.com/method/messages.getLastActivity";
            let params: Parameters = [
                "access_token": token,
                "user_id": userId
            ];
            
            fetchData(url: url, method: .post, parameters: params){
                (lastActivity: Response<LastActivity>?) in
                if let lastActivityFetched = lastActivity{
                    completion(lastActivityFetched.response);
                }
            }
        }
    }
    
    public struct SwiftVKPhotos{
        public let token: String;
        let url = "https://api.vk.com/method/photos.get";
        
        func get(ownerId: String,
                 albumId: String,
                 photoIds: String = "",
                 rev: Int = 0,
                 offset: String = "",
                 count: Int = 100,
                 completion: @escaping ([Photo]) -> ()){
            let params: Parameters = [
                "access_token": token,
                "owner_id": ownerId,
                "count": count,
                "rev": rev,
                "offset": offset,
                "album_id": albumId,
                "photo_ids": photoIds,
                "v": "5.131",
            ];
            
            fetchData(url: url, method: .post, parameters: params) {
                (photos: Response<Photos>?) in
                if let fetchedPhotos = photos{
                    completion(fetchedPhotos.response.items)
                }
            }
        }
    }
    
    public struct SwiftVKFriends{
        public let token: String;
        
        func get(fields: [String] = ["photo_100"], completion: @escaping ([User]) -> ()){
            let url = "https://api.vk.com/method/friends.get";
            let params: Parameters = [
                "access_token": token,
                "fields": fields.joined(separator: ","),
                "v": "5.131",
            ];
            
            fetchData(url: url, method: .post, parameters: params) {
                (friends: Response<Friends>?) in
                if let fetchedFriends = friends {
                    completion(fetchedFriends.response.items);
                }
            }
        }
    }
}
