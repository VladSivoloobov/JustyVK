import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageToolbar: ViewModifier{
    @State var name: String;
    @State var image: String;
    var onlineStatusVisible: String?;
    var isOnlineToggler: Bool;
    
    func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    MessageToolbarImage(image: image)
                }
                ToolbarItem(placement: .principal){
                    MessageNavbar(isOnline: isOnlineToggler, name: name, onlineStatusString: onlineStatusVisible)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func messageToolbar(name: String, image: String, onlineStatusVisible: String?, isOnline: Bool) -> some View{
        modifier(MessageToolbar(name: name, image: image, onlineStatusVisible: onlineStatusVisible, isOnlineToggler: isOnline));
    }
}
