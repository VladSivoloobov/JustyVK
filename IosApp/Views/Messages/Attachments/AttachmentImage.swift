import SwiftUI
import SDWebImageSwiftUI

struct AttachmentImage: View {
    var attachment: Attachment;
    var body: some View {
        WebImage(url: URL(string: attachment.photo!.sizes.last!.url))
            .resizable()
            .scaledToFill()
    }
}
