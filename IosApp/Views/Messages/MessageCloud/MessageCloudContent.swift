import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloudContent: View {
    var isSticker: Bool;
    var isAnimatedSticker: Bool;
    var message: Message;
    var lastSticker: Sticker?;
    var time: String;
    
    var body: some View {
        Group{
            VStack(alignment: .leading){
                if(isSticker){
                    if(!isAnimatedSticker){
                        MessageSticker(url: lastSticker?.images.last?.url);
                    }
                    else{
                        AnimatedMessageSticker(sticker: lastSticker!);
                    }
                } else{
                    if(!message.attachments.isEmpty){
                        ZStack(alignment: .bottomTrailing){
                            AttachmentsGrid(message: message);
                            MessageTime(time: time)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                                .cornerRadius(10)
                                .offset(x: -5, y: -5)
                        };
                    }
                    if(!message.text.isEmpty){
                        MessageText(message: message, time: time);
                    }
                }
            }
            if(isSticker || message.attachments.isEmpty){
                MessageTime(time: time)
                    .padding(.trailing, 6)
                    .padding(.bottom, 4)
            }
        }
    }
}
