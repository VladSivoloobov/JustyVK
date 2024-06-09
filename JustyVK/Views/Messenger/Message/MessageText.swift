import SwiftUI

struct MessageText: View {
    @ObservedObject var messageModel: MessageViewModel;
    
    var body: some View {
        HStack(alignment: .bottom){
            if(!messageModel.message.text.isEmpty){
                Text(messageModel.message.text)
                    .font(.system(size: 17.3))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(2)
            }
            if(!messageModel.message.attachments.isEmpty){
                Spacer();
                MessageTime(messageTime: messageModel.time);
            }
        }
        .padding(.top, 6)
        .padding(.horizontal, 10)
    }
}
