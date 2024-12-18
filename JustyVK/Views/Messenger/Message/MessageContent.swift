import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageContent: View {
    @ObservedObject var messageModel: MessageViewModel;
    var bool: Bool;
    
    var body: some View {
        VStack(alignment: .leading){
            if(messageModel.isSticker){
                StickerAttachment(messageModel: messageModel);
            } else{
                Attachments(messageModel: messageModel)
                if(!messageModel.message.text.isEmpty){
                    MessageText(messageModel: messageModel)
                        .padding(.bottom, !bool ? 7 : 1);
                }
            }
        }
        if(messageModel.isSticker || messageModel.message.attachments.isEmpty){
            MessageTime(messageTime: messageModel.time)
                .padding(.trailing, 10)
                .padding(.bottom, 1)
        }
    }
}
