import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloud: View {
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View {
        Group{
            Group{
                BooleanStack(messageModel: messageModel,
                             bool: !messageModel.isSticker || !messageModel.isAnimatedSticker,
                             horizontalAlign: .trailing,
                             verticalAlign: .bottom, spacing: 0){
                    MessageContent(messageModel: messageModel)
                }
                .messageCloudStyles(messageModel: messageModel)
                .messageCloudContextMenu()
            }
            .frame(maxWidth: 300, alignment: messageModel.fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: messageModel.fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}
