//
//  MessageAvatar.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 09.06.2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageAvatar: View {
    var image: String;
    var body: some View {
        WebImage(url: URL(string: image))
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            .clipShape(Circle())
    }
}

#Preview {
    MessageAvatar(image: "Avatar")
}
