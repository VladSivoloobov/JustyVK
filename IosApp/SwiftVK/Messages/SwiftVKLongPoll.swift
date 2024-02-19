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
        
        private func getLongPollEvent(server: String, key: String, ts: String, completion: @escaping (LongPollResponse) -> ()){
            let url = "https://\(server)?act=a_check&key=\(key)&ts=\(ts)&wait=25&mode=2&version=2";
            
            WebInteractions.fetchData(url: url, method: .get, parameters: [:]){
                (longPollResponse: LongPollResponse?) in
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
        
        private func checkUpdateEvent(updateCode: Int, update: [LongPollUpdate]){
            switch(updateCode){
            case 4:
                let events = filterEventListeners(value: updateCode);
                
                for event in events{
                    if case .integer(let messageId) = update[1],
                       case .integer(let flags) = update[2],
                       case .integer(let peerId) = update[3],
                       case .integer(let timestamp) = update[4],
                       case .string(let text) = update[5]{
                        var attachments: LongPollAttachments?;
                        
                        if case .longPollAttachments(let longPollAttachments) = update[6]{
                            attachments = longPollAttachments
                        }
                        
                        let messageEvent = NewMessageEvent(messageId: messageId, flags: flags, minorId: 0, peerId: peerId, timestamp: timestamp, text: text, attachments: attachments);
                        
                        event.callback(messageEvent);
                    }
                }
                break;
            default:
                break;
            }
        }
        
        private func polling(longPollServer: LongPoll){
            getLongPollEvent(server: longPollServer.server, key: longPollServer.key, ts: String(longPollServer.ts)){
                longPollEvent in
                                
                let newLongPollServer = LongPoll(server: longPollServer.server, key: longPollServer.key, ts: longPollEvent.ts);
                
                for update in longPollEvent.updates{
                    if case .integer(let value) = update[0]{
                        checkUpdateEvent(updateCode: value, update: update)
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
        
        static func addEventListener(event: LongPollUpdates, callback: @escaping (LongPollEvent) -> ()){
            let longPollListener = LongPollEventListener(event: event, callback: callback);
            SwiftVK.SwiftVKMessages.SwiftVKLongPoll.longPollEventListeners.append(longPollListener);
        }
    }
}
