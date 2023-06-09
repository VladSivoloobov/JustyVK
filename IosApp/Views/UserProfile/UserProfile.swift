//
//  UserProfile.swift
//  Весточка
//
//  Created by Vladislav on 04.06.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct UserProfile: View {
    var userId: Int;
    @State var name: String;
    @State private var avatar: String = "";
    @State var id: String = "anorakm56";
    @State var lastOnline: String = "был(а) 5 минут назад";
    @State var scale: CGFloat = 120;
    @State var avatarCornerRadius: CGFloat = 200;
    @State var avatarOffset: CGFloat = 70;
    
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        // TODO: Адаптировать под светлую тему
        ScrollView{
            VStack(spacing: 0){
                WebImage(url: URL(string: avatar))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: scale, height: scale)
                    .cornerRadius(avatarCornerRadius)
                    .padding(.bottom, 10)
                    .onTapGesture {
                        if scale == 400{
                            withAnimation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 80,
                                    damping: 15,
                                    initialVelocity: 10)
                            ){
                                scale = 120;
                                avatarCornerRadius = 200;
                                avatarOffset = 70;
                            }
                        }
                        else{
                            withAnimation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 80,
                                    damping: 15,
                                    initialVelocity: 20)
                            ){
                                scale = 400
                                avatarCornerRadius = 0;
                                avatarOffset = 0;
                            }
                        }
                    }
                Text(name)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                
                Text(lastOnline)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                VStack{
                    ProfileButtonsBar()
                        .padding(.top, 17)
                    UserProfileInfoRow(
                        title: "короткий адрес",
                        text: Text(
                            "@prostspak23"
                        )
                        .foregroundColor(.blue)
                    )
                    UserProfileInfoRow(
                        title: "статус",
                        text: Text(
                            "Когда у меня заканчиваются слова за меня начинает говорить моя мама"
                        )
                    )
                }
                .padding(.horizontal, 15)
            }
        }
        .toolbar{
//            ToolbarItem(placement: .principal){
//                // TODO: Сделать копирование айди
//                Text(id)
//                    .fontWeight(.medium)
//            }
        }
        .offset(y: avatarOffset)
        .toolbarBackground(.hidden, for: .navigationBar)
        .ignoresSafeArea()
        .onAppear{
            let vk = SwiftVK(token: userInfo.token);
            vk.photos.get(ownerId: String(userId), albumId: "profile", rev: 1){ photos in
                avatar = photos[0].sizes.last!.url;
            }
        }
    }
}
