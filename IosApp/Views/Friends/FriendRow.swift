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
    @State var online: String = "Был(а) 5 минут назад"
    @State var image: String;
    
    var body: some View {
        // TODO: Сделать возможность просмотра профиля
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
                Text(online)
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(name: "Анна Громова", image: "Avatar6")
    }
}
