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
    @StateObject var dialogInfo: DialogModel;
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        HStack(alignment: .top){
            WebImage(url: URL(string: dialogInfo.avatar ?? defaultImage))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
                .overlay(
                    UserOnlineStatus(isOnline: $dialogInfo.isOnline, width: 11)
                        .frame(width: 55, height: 55, alignment: .bottomTrailing)
                        .offset(x: -4, y: -1)
                )
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    Text(dialogInfo.userName ?? "Неизвестно")
                        .fontWeight(.medium)
                    Spacer()
                    Text(dialogInfo.time)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                HStack(){
                    Text(dialogInfo.lastMesagePreview(lastMessage: dialogInfo.lastMesage))
                        .foregroundColor(dialogInfo.attachmentTextColor)
                        .font(.system(size: 15))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1...2)
                        .frame(maxHeight: 55, alignment: .top)
                    Spacer()
                    //TODO: Заменить на настоящую переменную, это временная заглушка
//                    if false{
//                        UserReadMessageStatus()
//                    }
                }
                .offset(y: -5)
            }
        }
        .padding(.bottom, -7)
        .frame(maxHeight: 55, alignment: .center)
        .onAppear(){
            print(String(dialogInfo.userId));
            dialogInfo.setChatTitle();
        }
        .dialogContextMenu()
        .dialogSwipeActions()
        .dialogOverlay(dialogInfo: dialogInfo)
    }
}
