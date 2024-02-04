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
    //TODO: Заменить все переменные на одну структуру
    var userId: Int;
    @State var name: String;
    @State private var avatar: String = "";
    @State var id: String;
    @State var lastOnline: String;
    @State var scale: CGFloat = 120;
    @State var avatarCornerRadius: CGFloat = 200;
    @State var avatarOffset: CGFloat = 70;
    @State var status: String;
    @State var user: User;
    
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
                    .foregroundColor(user.online! == 1 ? .green : .gray)
                    .font(.system(size: 15))
                
                VStack{
                    ProfileButtonsBar()
                        .padding(.top, 17)
                    if(!id.isEmpty){
                        UserProfileInfoRow(
                            title: "Короткий адрес",
                            text: Text(
                                "@" + id
                            )
                            .foregroundColor(.blue)
                        )
                    }
                    if(!status.isEmpty){
                        UserProfileInfoRow(
                            title: "Статус",
                            text: Text(
                                status
                            )
                        )
                    }
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
                avatar = photos[0].sizes.last?.url ?? "https://vk.com/images/camera_400.png";
            }
            print(status)
            
//            vk.users.get(userId: userId, fields: [
//                "status",
//                "screen_name"
//            ]){ user in
//                status = user[0].status ?? "";
//                id = user[0].screenName ?? "";
//            }
        }
    }
}
