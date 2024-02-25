import Foundation
import SwiftUI

struct FloatingTime: View{
    @ObservedObject var messageModel: MessageModel;
    var body: some View{
        MessageTime(messageTime: messageModel.time)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Color(red: 0, green: 0, blue: 0).opacity(0.7))
            .cornerRadius(10)
            .offset(x: -5, y: -5)
    }
}
