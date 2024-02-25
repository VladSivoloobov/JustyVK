import SwiftUI

struct MessageCloudStyles: ViewModifier {
    @ObservedObject var messageModel: MessageModel;
    static public let paddingForAttachmentMessage = CGFloat(2);
    
    var paddingCount = MessageCloudStyles.paddingForAttachmentMessage;
    
    init(messageModel: MessageModel) {
        self.messageModel = messageModel;
        if(messageModel.isAttachment && messageModel.attachmentsCount > 1){
            paddingCount = MessageCloudStyles.paddingForAttachmentMessage;
        }
        else{
            paddingCount = 0;
        }
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, paddingCount)
            .padding(.vertical, paddingCount)
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
    func messageCloudStyles(messageModel: MessageModel) -> some View{
        modifier(MessageCloudStyles(messageModel: messageModel))
    }
}
