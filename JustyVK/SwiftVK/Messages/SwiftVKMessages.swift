import Foundation
import Alamofire

extension SwiftVK{
    public struct SwiftVKMessages{
        private let token: String;
        let longPoll: SwiftVKLongPoll;
        
        init(token: String){
            self.token = token;
            self.longPoll = SwiftVKLongPoll(token: token);
        }
        
        func getHistory(offset: Int?,
                        count: Int?,
                        userId: Int?,
                        peerId: Int?,
                        rev: Int?,
                        extended: Int?,
                        fields: String?,
                        groupId: Int?,
                        completion: @escaping (Messages) -> ()){
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
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params){
                (messages: Response<Messages>?) in
                if let fetchedMessages = messages {
                    completion(fetchedMessages.response);
                }
            }
        }
        
        func getConversations(offset: Int? = nil,
                              count: Int? = nil,
                              filter: String? = nil,
                              extended: Int = 0,
                              fields: [ExtendedFields] = [],
                              groupId: Int? = nil,
                              completion: @escaping (Conversations) -> ()){
            let url = "https://api.vk.com/method/messages.getConversations";
            let extendedString = SwiftVK.createExtendedString(extendedItems: fields);
            
            let params: Parameters = WebInteractions.filterParams(params: [
                "access_token": token,
                "count": count ?? "",
                "filter": filter ?? "",
                "extended": extended,
                "fields": extendedString,
                "groupId": groupId ?? "",
                "v": "5.131"
            ]);
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params){
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
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params){
                (lastActivity: Response<LastActivity>?) in
                if let lastActivityFetched = lastActivity{
                    completion(lastActivityFetched.response);
                }
            }
        }
    }

}
