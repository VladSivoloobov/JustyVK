import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageToolbarImage: View {
    var image: String;
    var body: some View {
        WebImage(url: URL(string: image))
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .cornerRadius(.infinity)
            .padding(.trailing, 5)
    }
}
