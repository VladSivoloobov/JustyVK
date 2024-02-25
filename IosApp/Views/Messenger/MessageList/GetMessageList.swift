import Foundation
import SwiftUI

struct GetMessageList: ViewModifier {
    var scrollReader: ScrollViewProxy;
    @Binding var messageList: [Message];
    var companionId: Int;
    @EnvironmentObject var userInfo: UserInfo;
    
    func body(content: Content) -> some View {
        content
            .onAppear{
                SwiftVKSingletone.shared.messages.getHistory(offset: nil, count: nil, userId: companionId, peerId: nil, rev: nil, extended: nil, fields: nil, groupId: nil){
                        messages in
                        messageList = messages;
            }
        }
    }
}

extension View{
    func getMessageList(scrollReader: ScrollViewProxy,
                        messageList: Binding<[Message]>,
                        companionId: Int) -> some View{
        modifier(GetMessageList(scrollReader: scrollReader, messageList: messageList, companionId: companionId));
    }
}
