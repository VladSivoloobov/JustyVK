//
//  Friend.swift
//  Весточка
//
//  Created by Vladislav on 03.06.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendRow: View {
    
    @State var name: String;
    @State var image: String;
    @State var lastSeenTime: Int;
    @State private var lastSeenString = "Был(а) в сети ";
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        HStack(alignment: .center){
            WebImage(url: URL(string: image))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
            VStack(alignment: .leading){
                Text(name)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                Text(lastSeenString + (lastSeenTime == -404 ? "недавно" : String(lastSeenTime)))
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
