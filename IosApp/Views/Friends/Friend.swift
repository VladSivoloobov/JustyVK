//
//  Friend.swift
//  Весточка
//
//  Created by Vladislav on 03.06.2023.
//

import SwiftUI

struct FriendRow: View {
    @State var name: String;
    @State var online: String = "Был(а) в сети 5 минут назад"
    @State var image: String;
    
    var body: some View {
        HStack(alignment: .top){
            Image(image)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 12){
                Text(name)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                HStack(alignment: .center){
                    Text(online)
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                    Spacer()
                }
                .offset(y: -5)
            }
        }
        .frame(height: 55, alignment: .center)
        .padding(.vertical, -9.2)
    }
}

struct Friend_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(name: "Анна Громова", image: "Avatar6")
    }
}
