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
    
    public struct SwiftVKUsers{
        private let url = "https://api.vk.com/method/users.get"
        public let token: String;
        
        func get(userId: Int, fields: [String] = [""], completion: @escaping ([User]) -> ()){
            let url = "https://api.vk.com/method/users.get";
            let params: Parameters = [
                "access_token": token,
                "user_ids": userId,
                "fields": fields.joined(separator: ","),
                "v": "5.131",
            ];
            
            fetchData(url: url, method: .post, parameters: params){
                (messages: UsersResponse?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response);
                }
            }
        }
    }
    
    public struct SwiftVKMessages{
        public let token: String;
        private let url = "https://api.vk.com/method/messages.getHistory"
        
        func getHistory(offset: Int?,
                        count: Int?,
                        userId: Int?,
                        peerId: Int?,
                        rev: Int?,
                        extended: Int?,
                        fields: String?,
                        groupId: Int?,
                        completion: @escaping ([VKMesage]) -> ()){
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
                (messages: MessagesResponse?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response.items);
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
                (photos: PhotosResponse?) in
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
                (friends: FriendsResponse?) in
                if let fetchedFriends = friends {
                    completion(fetchedFriends.response.items);
                }
            }
        }
    }
}
