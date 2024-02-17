import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloud: View {
    var message: Message;
    var fromMe: Bool;
    var time: String = "22:02";
    var isSticker: Bool;
    var lastSticker: Sticker?;
    var isAnimatedSticker: Bool = false;
    
    init(message: Message, fromMe: Bool, time: String) {
        self.message = message;
        self.fromMe = fromMe;
        self.time = time;
        if(message.attachments.count > 0){
            self.isSticker = message.attachments[0].sticker != nil;
            if(self.isSticker){
                self.isAnimatedSticker = message.attachments[0].sticker?.animationUrl != nil;
            }
            self.lastSticker = message.attachments[0].sticker;
        }
        else{
            self.isSticker = false;
        }
    }
    
    var body: some View {
        Group{
            Group{
                if(isSticker || isAnimatedSticker){
                    VStack(alignment: .trailing, spacing: 0){
                        MessageCloudContent(isSticker: isSticker, isAnimatedSticker: isAnimatedSticker, message: message, lastSticker: lastSticker, time: time)
                    }
                    .messageCloudStyles(fromMe: fromMe, isSticker: isSticker)
                    .messageCloudContextMenu()
                } else{
                    HStack(alignment: .bottom){
                        MessageCloudContent(isSticker: isSticker, isAnimatedSticker: isAnimatedSticker, message: message, lastSticker: lastSticker, time: time)
                    }
                    .messageCloudStyles(fromMe: fromMe, isSticker: isSticker, isAttachment: !message.attachments.isEmpty)
                    .messageCloudContextMenu()
                }
                
            }
            .frame(maxWidth: 300, alignment: fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}
