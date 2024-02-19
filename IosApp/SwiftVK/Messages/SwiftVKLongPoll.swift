import Foundation
import Alamofire

extension SwiftVK.SwiftVKMessages{
    struct SwiftVKLongPoll {
        var token: String;
        
        static var longPollEventListeners: [LongPollEventListener] = [];
        
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
        
        private func filterEventListeners(value: Int) -> [LongPollEventListener]{
            SwiftVK.SwiftVKMessages.SwiftVKLongPoll
                .longPollEventListeners.filter(){
                    $0.event.rawValue == value
                };
        }
        
        private func checkUpdateEvent(updateCode: Int, longPollEvent: LongPollEvent){
            switch(updateCode){
            case 4:
                let events = filterEventListeners(value: updateCode);
                
                for event in events{
                    event.callback(longPollEvent);
                }
                break;
            default:
                break;
            }
        }
        
        private func polling(longPollServer: LongPoll){
            getLongPollEvent(server: longPollServer.server, key: longPollServer.key, ts: String(longPollServer.ts)){
                longPollEvent in
                
                print(longPollEvent.updates);
                
                let newLongPollServer = LongPoll(server: longPollServer.server, key: longPollServer.key, ts: longPollEvent.ts);
                
                for update in longPollEvent.updates{
                    switch(update[0]){
                    case .integer(let value):
                        checkUpdateEvent(updateCode: value, longPollEvent: longPollEvent);
                    default:
                        break;
                    }
                    
                }
                
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
        
        func addEventListener(event: LongPollUpdates, callback: @escaping (LongPollEvent) -> ()){
            let longPollListener = LongPollEventListener(event: event, callback: callback);
            SwiftVK.SwiftVKMessages.SwiftVKLongPoll.longPollEventListeners.append(longPollListener);
        }
    }
}
