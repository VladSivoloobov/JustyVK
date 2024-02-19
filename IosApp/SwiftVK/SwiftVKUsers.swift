import Foundation
import Alamofire

extension SwiftVK{
    public struct SwiftVKUsers{
        private let url = "https://api.vk.com/method/users.get"
        public let token: String;
        
        func get(userId: Int?, fields: [String] = [""], completion: @escaping ([User]) -> ()){
            let url = "https://api.vk.com/method/users.get";
            let params: Parameters = WebInteractions.filterParams(params: [
                "access_token": token,
                "user_ids": userId ?? "",
                "fields": fields.joined(separator: ","),
                "v": "5.131",
            ]);
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params){
                (messages: Response<[User]>?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response);
                }
            }
        }
    }

}
