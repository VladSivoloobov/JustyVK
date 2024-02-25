import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloudContent: View {
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View {
        Group{
            VStack(alignment: .leading){
                if(messageModel.isSticker){
                    if(!messageModel.isAnimatedSticker){
                        MessageSticker(url: messageModel.lastSticker?.images.last?.url);
                    }
                    else{
                        AnimatedMessageSticker(sticker: messageModel.lastSticker!);
                    }
                } else{
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
