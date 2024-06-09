import SwiftUI

struct MessageStyles: ViewModifier {
    @ObservedObject var messageModel: MessageViewModel;
    static public let paddingForAttachmentMessage = CGFloat(2);
    
    var paddingCount = CGFloat(10);
    
    init(messageModel: MessageViewModel) {
        self.messageModel = messageModel;
        if(messageModel.isAttachment && messageModel.attachmentsCount > 1){
            paddingCount = MessageStyles.paddingForAttachmentMessage;
        }
        else{
            paddingCount = 0;
        }
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 3)
            .padding(.vertical, 3)
            .background(messageCloudBackground(fromMe: messageModel.fromMe, isSticker: messageModel.isSticker))
            .cornerRadius(15)
            .compositingGroup()
    }
    
    func messageCloudBackground(fromMe: Bool, isSticker: Bool) -> Color{
        if(isSticker){
            return Color.black.opacity(0);
        }
        if(fromMe){
            return Color.blue;
        }
        return Color(red: 35 / 255, green: 35 / 255, blue: 36 / 255)
    }
}

extension View {
    func messageStyles(messageModel: MessageViewModel) -> some View{
        modifier(MessageStyles(messageModel: messageModel))
    }
}
