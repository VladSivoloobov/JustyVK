import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloud: View {
    @ObservedObject var messageModel: MessageViewModel;
    
    var body: some View {
        Group{
            Group{
                BooleanStack(
                    bool: messageModel.message.text.count > 17,
                    horizontalAlign: .trailing,
                    verticalAlign: .bottom, spacing: 0
                ){
                    MessageContent(messageModel: messageModel)
                }
                .messageStyles(messageModel: messageModel)
                .messageContextMenu()
            }
            .frame(maxWidth: 300, alignment: messageModel.fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: messageModel.fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}
