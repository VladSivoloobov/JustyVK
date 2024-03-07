//
//  FriendAvatar.swift
//  JustyVK
//
//  Created by  Владислав on 02.03.2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendAvatar: View {
    @ObservedObject var userProfileViewModel: UserProfileViewModel;
    
    var body: some View {
        WebImage(url: URL(string: userProfileViewModel.user.photo100!))
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .cornerRadius(.infinity)
            .padding(.trailing, 5)
            .overlay(alignment: .bottomTrailing){
                if(userProfileViewModel.isOnline){
                    UserOnlineStatus(isOnline: $userProfileViewModel.isOnline)
                        .offset(x: -3)
                }
            }
    }
}
