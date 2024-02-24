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
    var attachmentTextColor = Color.gray;
    
    var userId: Int;
    var chatType: String;
    // TODO: Заменить на настоящее время
    var time: String = "22:02";
    
    init(conversation: Conversation, lastMesage: ConversationInfo.ConversationLastMessage) {
        self.conversation = conversation
        self.lastMesage = lastMesage
        self.userName = conversation.chatSettings?.title
        self.userId = conversation.peer.id
        self.chatType = conversation.peer.type
        self.avatar = conversation.chatSettings?.photo.photo200 ?? defaultImage;
        if(!lastMesage.attachments.isEmpty && lastMesage.text.isEmpty){
            attachmentTextColor = Color.white;
        }
    }
    
    @EnvironmentObject var userInfo: UserInfo;
    
    func lastMesagePreview(lastMessage: ConversationInfo.ConversationLastMessage) -> String{
        if(!lastMessage.text.isEmpty){
            return lastMessage.text;
        }
        
        switch(lastMessage.attachments.last?.type){
        case "sticker":
            return "Cтикер";
        case "photo":
            return "Фото";
        case "video":
            return "Видео";
        case "audio":
            return "Аудиозапись";
        case "link":
            return "Ссылка";
        default:
            return "Вложение";
        }
    }
    
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
                    Text(lastMesagePreview(lastMessage: lastMesage))
                        .foregroundColor(attachmentTextColor)
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
            print(String(userId));
            if(conversation.chatSettings?.title == nil && chatType == "user"){
                SwiftVK(token: userInfo.token).users.get(userId: userId, fields: [
                    "photo_100",
                    "online",
                    "sex",
                    "last_seen"
                ]){
                    users in
                    userName = users[0].firstName + " " + users[0].lastName;
                    avatar = users[0].photo100 ?? defaultImage;
                    
                    isOnline = users[0].online == 1;
                    isOnlineString = SwiftVK.createLastSeenString(lastSeenTime: users[0].lastSeen?.time, isOnline: users[0].online, sex: users[0].sex)
                    
                }
            }
            else if(userId < 0){
                print(String(userId));
                SwiftVK(token: userInfo.token).groups.getById(groupsIds: String(abs(userId)), groupId: nil, fields: nil){
                    groups in
                    userName = groups[0].name;
                    avatar = groups[0].photo200;
                    isOnline = false;
                }
            }
            else{
                avatar = conversation.chatSettings?.photo.photo200;
            }
        }
        .dialogContextMenu()
        .dialogSwipeActions()
        .dialogOverlay(dialog: conversation, companionId: userId, userName: $userName, avatar: $avatar, onlineStatusVisible: isOnlineString, isOnline: isOnline ?? false)
    }
}
