import SwiftUI

struct MessageCloudStyles: ViewModifier {
    var fromMe: Bool;
    var isSticker: Bool;
    var isAttachment: Bool;
    var attachmentsCount: Int = 0;
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, isAttachment && attachmentsCount > 1 ? 2 : 0)
            .padding(.vertical, isAttachment && attachmentsCount > 1 ? 2 : 0)
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
    func messageCloudStyles(fromMe: Bool, isSticker: Bool, isAttachment: Bool = false, attachmentsCount: Int) -> some View{
        modifier(MessageCloudStyles(fromMe: fromMe, isSticker: isSticker, isAttachment: isAttachment, attachmentsCount: attachmentsCount))
    }
}
