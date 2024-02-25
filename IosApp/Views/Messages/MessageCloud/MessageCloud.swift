import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloud: View {
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View {
        Group{
            Group{
                //TODO: Отрефакторить это место
                if(messageModel.isSticker || messageModel.isAnimatedSticker){
                    VStack(alignment: .trailing, spacing: 0){
                        MessageCloudContent(messageModel: messageModel)
                    }
                    .messageCloudStyles(messageModel: messageModel)
                    .messageCloudContextMenu()
                } else{
                    HStack(alignment: .bottom){
                        MessageCloudContent(messageModel: messageModel)
                    }
                    .messageCloudStyles(messageModel: messageModel)
                    .messageCloudContextMenu()
                }
                
            }
            .frame(maxWidth: 300, alignment: messageModel.fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: messageModel.fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}
