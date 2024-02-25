import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageSticker: View{
    var url: String?;
    var body: some View{
        WebImage(url: URL(string: url ?? ""))
            .resizable()
            .stickerSizes()
    }
}
