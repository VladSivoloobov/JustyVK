import Foundation
import SwiftUI

struct StickerSizes: ViewModifier{
    func body(content: Content) -> some View {
        content.frame(minWidth: 0, idealWidth: 150, maxWidth: 200, minHeight: 0, idealHeight: 200, maxHeight: 300, alignment: .leading)
    }
}

extension View{
    func stickerSizes() -> some View{
        modifier(StickerSizes())
    }
}
