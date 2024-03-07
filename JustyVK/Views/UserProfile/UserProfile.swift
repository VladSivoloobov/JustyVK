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
    @StateObject var userProfileViewModel: UserProfileViewModel;
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        // TODO: Адаптировать под светлую тему
        ScrollView{
            VStack(spacing: 0){
                UserProfileAvatar(userProfileViewModel: userProfileViewModel)
                Text(userProfileViewModel.name)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                
                Text(userProfileViewModel.lastSeenString)
                    .foregroundColor(userProfileViewModel.isOnline ? .green : .gray)
                    .font(.system(size: 15))
                
                VStack{
                    ProfileButtonsBar()
                        .padding(.top, 17)
                    if(!userProfileViewModel.id.isEmpty){
                        UserProfileInfoRow(
                            title: "Короткий адрес",
                            text: Text(
                                "@\(userProfileViewModel.user.screenName ?? String(userProfileViewModel.user.id))"
                            )
                            .foregroundColor(.blue)
                        )
                    }
                    if(!userProfileViewModel.status.isEmpty){
                        UserProfileInfoRow(
                            title: "Статус",
                            text: Text(
                                userProfileViewModel.status
                            )
                        )
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .offset(y: userProfileViewModel.avatarOffset)
        .toolbarBackground(.hidden, for: .navigationBar)
        .ignoresSafeArea()
        .onAppear(){
            userProfileViewModel.fetchAvatar()
        }
    }
}
