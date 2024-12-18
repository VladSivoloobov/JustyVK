import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageItem: View {
    @ObservedObject var messageModel: MessageViewModel;
    @ObservedObject var dialogInfo: DialogViewModel;
    var nextSame: Bool;
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5){
            if(!messageModel.fromMe && dialogInfo.chatType == .chat){
                MessageAvatar(image: messageModel.profilesList.first(where: {
                    $0.id == messageModel.message.fromId;
                })?.photo100 ?? defaultImage)
            }
            Group{
                BooleanStack(
                    bool: messageModel.message.text.count > 17,
                    horizontalAlign: .trailing,
                    verticalAlign: .bottom, spacing: 0
                ){
                    MessageContent(messageModel: messageModel, bool: messageModel.message.text.count > 17)
                }
                .messageStyles(messageModel: messageModel)
                .messageContextMenu()
            }
            .frame(maxWidth: 300, alignment: messageModel.fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: messageModel.fromMe ? .trailing : .leading)
        .padding(.horizontal, 10)
    }
}
