import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageContent: View {
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View {
        Group{
            VStack(alignment: .leading){
                if(messageModel.isSticker){
                    StickerAttachment(messageModel: messageModel);
                } else{
                    Attachments(messageModel: messageModel)
                    if(!messageModel.message.text.isEmpty){
                        MessageText(messageModel: messageModel);
                    }
                }
            }
            if(messageModel.isSticker || messageModel.message.attachments.isEmpty){
                MessageTime(messageTime: messageModel.time)
                    .padding(.trailing, 6)
                    .padding(.bottom, 4)
           }
        }
    }
}
