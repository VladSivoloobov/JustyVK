import Foundation
import SwiftUI

struct Attachments: View{
    @ObservedObject var messageModel: MessageViewModel;
    
    var body: some View{
        if(!messageModel.message.attachments.isEmpty){
            ZStack(alignment: .bottomTrailing){
                AttachmentsGrid(message: messageModel.message);
                if(messageModel.message.text.isEmpty){
                    FloatingTime(messageModel: messageModel)
                }
            };
        }
    }
}
