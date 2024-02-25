import Foundation
import Alamofire

extension SwiftVK{
    public class SwiftVKGroups{
        init(token: String) {
            self.token = token
        }
        public let token: String;
        
        func getById(groupsIds: String?, groupId: String?, fields: String?, completion: @escaping ([VKGroup]) -> ()){
            let url = "https://api.vk.com/method/groups.getById"
            let params: Parameters = WebInteractions.filterParams(params: [
                "access_token": token,
                "group_ids": groupsIds ?? "",
                "group_id": groupId ?? "",
                "fields": fields ?? "",
                "v": "5.131"
            ]);
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params){
            (groups: Response<[VKGroup]>?) in
                if let fetchedGroups = groups {
                    completion(fetchedGroups.response);
                }
            }
        }
    }
}
