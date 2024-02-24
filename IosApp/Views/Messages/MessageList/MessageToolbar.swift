import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageToolbar: ViewModifier{
    @ObservedObject var dialogInfo: DialogInfo;
    
    func body(content: Content) -> some View {
        content
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    MessageToolbarImage(image: dialogInfo.avatar ?? defaultImage)
                }
                ToolbarItem(placement: .principal){
                    MessageNavbar(dialogInfo: dialogInfo)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func messageToolbar(dialogInfo: DialogInfo) -> some View{
        modifier(MessageToolbar(dialogInfo: dialogInfo));
    }
}
