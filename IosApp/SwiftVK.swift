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
        self.messages = SwiftVKMessages()
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
            
            AF.request(url, method: .post, parameters: params).response{ result in
                do{
                    if let data = result.data{
                        let users = try JSONDecoder().decode(UsersResponse.self, from: data).response;
                        completion(users);
                    }
                }
                catch{
                    print("usersError: " + error.localizedDescription)
                }
            }
        }
    }
    
    public struct SwiftVKMessages{
        func get(){
            
        }
    }
    
    public struct SwiftVKPhotos{
        public let token: String;
        
        func get(ownerId: String,
                 albumId: String,
                 photoIds: String = "",
                 rev: Int = 0,
                 offset: String = "",
                 count: Int = 100,
                 completion: @escaping ([Photo]) -> ()){
            let url = "https://api.vk.com/method/photos.get";
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
            
            AF.request(url, method: .post, parameters: params).response{ result in
                do{
                    if let data = result.data{
                        let photos = try JSONDecoder().decode(PhotosResponse.self, from: data).response.items;
                        completion(photos);
                    }
                }
                catch{
                    print("photosError: " + error.localizedDescription)
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
            
            AF.request(url, method: .post, parameters: params).response{ result in
                do{
                    if let data = result.data{
                        let friends = try JSONDecoder().decode(FriendsResponse.self, from: data).response.items;
                        completion(friends);
                    }
                }
                catch{
                    print(error)
                }
            }
        }
    }
}
