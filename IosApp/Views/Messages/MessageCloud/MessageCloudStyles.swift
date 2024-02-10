import SwiftUI

struct MessageCloudStyles: ViewModifier {
    var fromMe: Bool;
    var isSticker: Bool;
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(messageCloudBackground(fromMe: fromMe, isSticker: isSticker))
            .cornerRadius(15)
            .compositingGroup()
    }
    
    func messageCloudBackground(fromMe: Bool, isSticker: Bool) -> Color{
        if(isSticker){
            return Color.black.opacity(0);
        }
        if(fromMe){
            return Color.blue;
        }
        return Color(red: 35 / 255, green: 35 / 255, blue: 36 / 255)
    }
}

extension View {
    func messageCloudStyles(fromMe: Bool, isSticker: Bool) -> some View{
        modifier(MessageCloudStyles(fromMe: fromMe, isSticker: isSticker))
    }
}
