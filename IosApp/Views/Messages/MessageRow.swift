//
//  Message.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct MessageRow: View {
    var lastMessage: String;
    var messageAutor: String;
    var messageAvatar: Image?;
    var isOnline: Bool;
    var avatar: String;
    var isReaded: Bool = false;
    var time: String = "10:24";
    
    var body: some View {
        HStack(alignment: .top){
            Image(avatar)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Text(messageAutor)
                        .fontWeight(.bold)
                    if isOnline{
                        Online()
                    }
                    Spacer()
                    Text(time)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
                HStack(alignment: .center){
                    Text(lastMessage)
                        .foregroundColor(.gray)
                        .font(.system(size: 17))
                    Spacer()
                    if !isReaded{
                        ReadStatus()
                    }
                }
                .offset(y: -5)
            }
        }
        .frame(height: 55, alignment: .center)
        .padding(.bottom, -7)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(lastMessage: "Привет", messageAutor: "Анна Гростимова", isOnline: true, avatar: "Avatar")
            .previewLayout(.fixed(width: 350, height: 90))
    }
}
