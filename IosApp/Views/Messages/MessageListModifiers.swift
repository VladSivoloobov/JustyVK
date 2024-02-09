import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageToolbar: ViewModifier{
    @State var name: String;
    @State var image: String;
    var onlineStatusVisible: String?;
    var isOnlineToggler: Bool;
    
    func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    MessageToolbarImage(image: image)
                }
                ToolbarItem(placement: .principal){
                    MessageNavbar(isOnline: isOnlineToggler, name: name, onlineStatusString: onlineStatusVisible)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct GetMessageList: ViewModifier {
    var scrollReader: ScrollViewProxy;
    @Binding var messageList: [Message];
    var companionId: Int;
    @EnvironmentObject var userInfo: UserInfo;
    
    func body(content: Content) -> some View {
        content
            .onAppear{
            // TODO: При взаимодействии с api изменить скролл
                SwiftVK(token: userInfo.token).messages.getHistory(offset: nil, count: nil, userId: companionId, peerId: nil, rev: nil, extended: nil, fields: nil, groupId: nil){
                        messages in
                        messageList = messages;
            }
        }
    }
}

extension View {
    func messageToolbar(name: String, image: String, onlineStatusVisible: String?, isOnline: Bool) -> some View{
        modifier(MessageToolbar(name: name, image: image, onlineStatusVisible: onlineStatusVisible, isOnlineToggler: isOnline));
    }
    
    func getMessageList(scrollReader: ScrollViewProxy,
                        messageList: Binding<[Message]>,
                        companionId: Int) -> some View{
        modifier(GetMessageList(scrollReader: scrollReader, messageList: messageList, companionId: companionId));
    }
}
