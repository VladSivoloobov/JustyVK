import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloud: View {
    var message: Message;
    var fromMe: Bool;
    var time: String = "22:02";
    var isSticker: Bool;
    var lastSticker: Sticker?;
    
    init(message: Message, fromMe: Bool, time: String) {
        self.message = message;
        self.fromMe = fromMe;
        self.time = time;
        if(message.attachments.count > 0){
            self.isSticker = message.attachments[0].sticker != nil;
            self.lastSticker = message.attachments[0].sticker;
        }
        else{
            self.isSticker = false;
        }
    }
    
    var body: some View {
        Group{
            Group{
                HStack(alignment: .bottom){
                    Group{
                        VStack{
                            if(message.attachments.count > 0){
                                if(isSticker){
                                    WebImage(url: URL(string: lastSticker?.images.last?.url ?? ""))
                                        .resizable()
                                        .frame(minWidth: 0, idealWidth: 150, maxWidth: 200, minHeight: 0, idealHeight: 200, maxHeight: 300, alignment: .leading)
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
                .messageCloudStyles(fromMe: fromMe, isSticker: isSticker)
                .messageCloudContextMenu()
            }
            .frame(maxWidth: 300, alignment: fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}
