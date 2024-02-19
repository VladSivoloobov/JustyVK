import Foundation
import Alamofire

extension SwiftVK.SwiftVKMessages{
    struct SwiftVKLongPoll {
        var token: String;
        
        private func getLongPollServer(completion: @escaping (LongPoll) -> ()){
            let url = "https://api.vk.com/method/messages.getLongPollServer";
            let params: Parameters = [
                "access_token": token,
                "v": "5.131"
            ];
            
            WebInteractions.fetchData(url: url, method: .get, parameters: params){
                (longPoll: Response<LongPoll>?) in
                if let longPollResponse = longPoll{
                    completion(longPollResponse.response);
                }
            }
        }
        
        private func getLongPollEvent(server: String, key: String, ts: String, completion: @escaping (LongPollEvent) -> ()){
            let url = "https://\(server)?act=a_check&key=\(key)&ts=\(ts)&wait=25&mode=2&version=2";
            
            WebInteractions.fetchData(url: url, method: .get, parameters: [:]){
                (longPollResponse: LongPollEvent?) in
                if let longPollEvent = longPollResponse {
                    completion(longPollEvent);
                }
            }
        }
        
        private func polling(longPollServer: LongPoll){
            getLongPollEvent(server: longPollServer.server, key: longPollServer.key, ts: String(longPollServer.ts)){
                longPollEvent in
                
                print(longPollEvent.updates);
                
                let newLongPollServer = LongPoll(server: longPollServer.server, key: longPollServer.key, ts: longPollEvent.ts);
                
                polling(longPollServer: newLongPollServer);
            }
        }
        
        func startLongPolling() {
            getLongPollServer{
                longPollServer in
                Task.init{
                    polling(longPollServer: longPollServer)
                }
            }
        }
    }
}
