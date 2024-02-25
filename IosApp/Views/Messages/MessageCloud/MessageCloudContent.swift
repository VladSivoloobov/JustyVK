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
                    if(!messageModel.message.attachments.isEmpty){
                        ZStack(alignment: .bottomTrailing){
                            AttachmentsGrid(message: messageModel.message);
                            if(messageModel.message.text.isEmpty){
                                MessageTime(time: messageModel.time)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 4)
                                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                                    .cornerRadius(10)
                                    .offset(x: -5, y: -5)
                            }
                        };
                    }
                    if(!messageModel.message.text.isEmpty){
                        MessageText(message: messageModel.message, time: messageModel.time);
                    }
                }
            }
            if(messageModel.isSticker || messageModel.message.attachments.isEmpty){
                MessageTime(time: messageModel.time)
                    .padding(.trailing, 6)
                    .padding(.bottom, 4)
            }
        }
    }
}
