import SwiftUI

struct MessageTime: View {
    var messageTime: String;
    var body: some View {
        Text(messageTime)
            .font(Font.system(size: 10))
            .foregroundColor(.white)
    }
}
