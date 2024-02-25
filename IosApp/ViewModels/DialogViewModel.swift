import Foundation
import SwiftUI

class DialogViewModel: ObservableObject{
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
    
    @Published var conversation: Conversation;
    @Published var lastMesage: ConversationInfo.ConversationLastMessage;
    @Published var userName: String?;
    @Published var avatar: String?;
    @Published var isOnline: Bool?;
    @Published var isOnlineString: String?;
    @Published var attachmentTextColor = Color.gray;
    @Published var userId: Int;
    @Published var chatType: String;
    // TODO: Заменить на настоящее время
    @Published var time: String = "22:02";
    
    //TODO: Изменить swiftVK на синглтон
    func getUserInfo(){
        SwiftVKSingletone.shared.users.get(userId: userId, fields: [
            "photo_100",
            "online",
            "sex",
            "last_seen"
        ]){
            users in
            self.userName = users[0].firstName + " " + users[0].lastName;
            self.avatar = users[0].photo100 ?? defaultImage;
            
            self.isOnline = users[0].online == 1;
            self.isOnlineString = SwiftVK.createLastSeenString(lastSeenTime: users[0].lastSeen?.time, isOnline: users[0].online, sex: users[0].sex)
            
        }
    }
    
    func getGroupInfo(){
        SwiftVKSingletone.shared.groups.getById(groupsIds: String(abs(userId)), groupId: nil, fields: nil){
            groups in
            self.userName = groups[0].name;
            self.avatar = groups[0].photo200;
            self.isOnline = false;
        }
    }
    
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
    
    func setChatTitle(){
        if(conversation.chatSettings?.title == nil && chatType == "user"){
            getUserInfo();
        }
        else if(userId < 0){
            getGroupInfo()
        }
        else{
            avatar = conversation.chatSettings?.photo.photo200;
        }
    }
}
