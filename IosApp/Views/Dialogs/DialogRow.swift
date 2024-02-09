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
    @State var conversation: Conversation;
    @State var lastMesage: ConversationInfo.ConversationLastMessage;
    @State var userName: String?;
    @State var avatar: String?;
    @State var isOnline: Bool?;
    @State var isOnlineString: String?;
    var tabBarIsVisible: Binding<Bool>;
    
    var userId: Int;
    var chatType: String;
    // TODO: Заменить на настоящее время
    var time: String = "22:02";
    
    init(conversation: Conversation, lastMesage: ConversationInfo.ConversationLastMessage, tabBarVisibleBinding: Binding<Bool>) {
        self.conversation = conversation
        self.lastMesage = lastMesage
        self.userName = conversation.chatSettings?.title
        self.userId = conversation.peer.id
        self.chatType = conversation.peer.type
        self.avatar = conversation.chatSettings?.photo.photo200 ?? defaultImage;
        self.tabBarIsVisible = tabBarVisibleBinding;
    }
    
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        HStack(alignment: .top){
            WebImage(url: URL(string: avatar ?? defaultImage))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
                .padding(.trailing, 5)
                .overlay(
                    //TODO: Здесь изменить на настоящий статус
                    UserOnlineStatus(isOnline: $isOnline, width: 11)
                        .frame(width: 55, height: 55, alignment: .bottomTrailing)
                        .offset(x: -4, y: -1)
                )
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    Text(userName ?? "Неизвестно")
                        .fontWeight(.medium)
                    Spacer()
                    Text(time)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                HStack(){
                    Text(lastMesage.text)
                        .foregroundColor(.gray)
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
            if(conversation.chatSettings?.title == nil && chatType == "user"){
                SwiftVK(token: userInfo.token).users.get(userId: userId, fields: [
                    "photo_100",
                    "online",
                    "sex",
                    "last_seen"
                ]){
                    users in
                    userName = users[0].firstName + " " + users[0].lastName
                    avatar = users[0].photo100 ?? defaultImage;
                    
                    isOnline = users[0].online == 1;
                    isOnlineString = SwiftVK.createLastSeenString(lastSeenTime: users[0].lastSeen?.time, isOnline: users[0].online, sex: users[0].sex)
                    print(isOnlineString!)
                    
                }
            }
        }
        .dialogContextMenu()
        .dialogSwipeActions()
        .dialogOverlay(dialog: conversation, tabBarVisibleBinding: tabBarIsVisible, companionId: userId, userName: $userName, avatar: $avatar, onlineStatusVisible: isOnlineString, isOnline: isOnline ?? false)
    }
}
