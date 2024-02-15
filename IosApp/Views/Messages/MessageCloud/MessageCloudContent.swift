import SwiftUI

struct MessageCloudContent: View {
    var isSticker: Bool;
    var isAnimatedSticker: Bool;
    var message: Message;
    var lastSticker: Sticker?;
    var time: String;
    
    var body: some View {
        Group{
            VStack{
                if(message.attachments.count > 0){
                    if(isSticker){
                        if(!isAnimatedSticker){
                            MessageSticker(url: lastSticker?.images.last?.url);
                        }
                        else{
                            AnimatedMessageSticker(sticker: lastSticker!)
                        }
                    }
                }
                if(!isSticker){
                    Text(message.text)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Text(time)
                .font(Font.system(size: 10))
                .foregroundColor(.white)
        }
    }
}
