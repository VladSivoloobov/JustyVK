import SwiftUI

struct StickerAttachment: View{
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View{
        if(!messageModel.isAnimatedSticker){
            MessageSticker(url: messageModel.lastSticker?.images.last?.url);
        }
        else{
            AnimatedMessageSticker(sticker: messageModel.lastSticker!);
        }
    }
}
