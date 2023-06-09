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
        self.users = SwiftVKUsers()
        self.messages = SwiftVKMessages()
        self.photos = SwiftVKPhotos(token: token)
    }
    
    public struct SwiftVKUsers{
        private var url = "https://api.vk.com/method/users.get"
        func get(){
            
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
                        print(photos)
                    }
                }
                catch{
                    print(error)
                }
            }
        }
        
        public struct PhotosResponse: Decodable{
            var response: Photos;
            enum CodingKeys: String, CodingKey {
                case response = "response"
            }
        }
        
        public struct Photos: Decodable{
            var items: [Photo];
            enum CodingKeys: String, CodingKey {
                case items = "items"
            }
        }
        
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
    }
    
    public struct SwiftVKFriends{
        public let token: String;
        
        func get(completion: @escaping ([Friend]) -> ()){
            let url = "https://api.vk.com/method/friends.get";
            let params: Parameters = [
                "access_token": token,
                "fields": "photo_50",
                "v": "5.131",
                "count": 30
            ];
            
            AF.request(url, method: .post, parameters: params).response{ result in
                do{
                    if let data = result.data{
                        let friends = try JSONDecoder().decode(FriendsResponse.self, from: data).response.items;
                        completion(friends);
                        print(friends)
                    }
                }
                catch{
                    print(error)
                }
            }
        }
        
        public struct FriendsResponse: Decodable{
            var response: Friends;
        }

        public struct Friends: Decodable{
            var items: [Friend];
        }

        public struct Friend: Decodable{
            var id: Int;
            var photo: String;
            var firstName: String;
            var lastName: String;
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case photo = "photo_50"
                case firstName = "first_name"
                case lastName = "last_name"
            }
        }
    }
}
