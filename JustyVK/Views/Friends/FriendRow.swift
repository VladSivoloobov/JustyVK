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
    @EnvironmentObject var userInfo: UserInfo;
    @EnvironmentObject var globalUIStates: GlobalUIStates;
    @StateObject var userProfileViewModel: UserProfileViewModel;
    
    var body: some View {
        HStack(alignment: .center){
            FriendAvatar(userProfileViewModel: userProfileViewModel)
            VStack(alignment: .leading){
                Text(userProfileViewModel.name)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                HStack(spacing: 2){
                    Text(userProfileViewModel.lastSeenString)
                    
                }
                .foregroundColor(userProfileViewModel.isOnline ? .green : .gray)
                .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .friendRowOverlay(userProfileViewModel: userProfileViewModel)
        }
    }
}
