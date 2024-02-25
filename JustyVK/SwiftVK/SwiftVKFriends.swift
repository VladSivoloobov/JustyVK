import Foundation
import Alamofire

extension SwiftVK{
    public class SwiftVKFriends{
        init(token: String) {
            self.token = token
        }
        public let token: String;
        
        func get(fields: [String] = ["photo_100"], completion: @escaping ([User]) -> ()){
            let url = "https://api.vk.com/method/friends.get";
            let params: Parameters = [
                "access_token": token,
                "fields": fields.joined(separator: ","),
                "v": "5.131",
            ];
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params) {
                (friends: Response<Friends>?) in
                if let fetchedFriends = friends {
                    completion(fetchedFriends.response.items);
                }
            }
        }
    }

}
