import Alamofire
import Foundation

public struct SwiftVK {
    public let token: String;
    public let friends: SwiftVKFriends;
    public let users: SwiftVKUsers;
    public let messages: SwiftVKMessages;
    
    public init(token: String) {
        self.token = token
        self.friends = SwiftVKFriends(token: token)
        self.users = SwiftVKUsers()
        self.messages = SwiftVKMessages()
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
    
    public struct SwiftVKFriends{
        public let token: String;
        public let url = "https://api.vk.com/method/friends.get";
        
        func get(completion: @escaping ([Friend]) -> ()){
            print("Выполняюсь")
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
            var photo: String;
            var firstName: String;
            var lastName: String;
            
            enum CodingKeys: String, CodingKey {
                case photo = "photo_50"
                case firstName = "first_name"
                case lastName = "last_name"
            }
        }
    }
}
