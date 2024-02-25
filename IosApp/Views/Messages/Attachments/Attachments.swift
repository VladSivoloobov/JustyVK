import Foundation
import SwiftUI

struct Attachments: View{
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View{
        if(!messageModel.message.attachments.isEmpty){
            ZStack(alignment: .bottomTrailing){
                AttachmentsGrid(message: messageModel.message);
                if(messageModel.message.text.isEmpty){
                    MessageTime(messageTime: messageModel.time)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                        .cornerRadius(10)
                        .offset(x: -5, y: -5)
                }
            };
        }
    }
}
