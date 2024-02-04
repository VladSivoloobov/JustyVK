import SwiftUI

struct MessageToolbar: ViewModifier{
    @State var name: String;
    @State var image: String;
    
    func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(image)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(.infinity)
                        .padding(.trailing, 5)
                }
                ToolbarItem(placement: .principal){
                    MessageNavbar(name: name)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct GetMessageList: ViewModifier {
    var scrollReader: ScrollViewProxy;
    @Binding var messageList: [VKMesage];
    var companionId: Int;
    @EnvironmentObject var userInfo: UserInfo;
    
    func body(content: Content) -> some View {
        content
            .onAppear{
            // TODO: При взаимодействии с api изменить скролл
                scrollReader.scrollTo(messages.count - 1)
                SwiftVK(token: userInfo.token).messages.getHistory(offset: nil, count: nil, userId: companionId, peerId: nil, rev: nil, extended: nil, fields: nil, groupId: nil){
                        messages in
                        messageList = messages;
            }
        }
    }
}

extension View {
    func messageToolbar(name: String, image: String) -> some View{
        modifier(MessageToolbar(name: name, image: image));
    }
    
    func getMessageList(scrollReader: ScrollViewProxy,
                        messageList: Binding<[VKMesage]>,
                        companionId: Int) -> some View{
        modifier(GetMessageList(scrollReader: scrollReader, messageList: messageList, companionId: companionId));
    }
}
