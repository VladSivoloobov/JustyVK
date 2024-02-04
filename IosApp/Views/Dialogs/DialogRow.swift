//
//  Message.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct DialogRow: View {
    @State var lastMessage: String;
    @State var messageAutor: String;
    @State var messageAvatar: Image?;
    @State var isOnline: Bool;
    @State var avatar: String;
    @State var isReaded: Bool = false;
    @State var time: String = "10:24";
    @State var unreadCount = 0;
    
    var body: some View {
        HStack(alignment: .top){
            WebImage(url: URL(string: avatar))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
                .overlay(
                    UserOnlineStatus(isOnline: isOnline)
                        .frame(width: 55, height: 55, alignment: .bottomTrailing)
                        .offset(x: -3, y: -2)
                )
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    Text(messageAutor)
                        .fontWeight(.medium)
                    Spacer()
                    Text(time)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                HStack(){
                    Text(lastMessage)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1...2)
                        .frame(maxHeight: 55, alignment: .top)
                    Spacer()
                    if !isReaded{
                        UserReadMessageStatus()
                    }
                }
                .offset(y: -5)
            }
        }
        .padding(.bottom, -7)
        .frame(maxHeight: 55, alignment: .center)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        DialogRow(lastMessage: "Привет", messageAutor: "Анна Гростимова", isOnline: true, avatar: "Avatar")
            .previewLayout(.fixed(width: 350, height: 90))
    }
}
