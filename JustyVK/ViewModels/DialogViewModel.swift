import Foundation
import SwiftUI

class DialogViewModel: ObservableObject{
    init(_ conversationInfo: ConversationInfo, profileList: [ExtendedInfo]) {
        self.profileList = profileList;
        self.conversationInfo = conversationInfo;
        self.conversation = conversationInfo.conversation;
        self.lastMesage = conversationInfo.lastMessage;
        self.userName = conversationInfo.conversation.chatSettings?.title
        self.userId = conversationInfo.conversation.peer.id
        self.chatType = conversationInfo.conversation.peer.type
        self.avatar = conversation.chatSettings?.photo.photo200 ?? defaultImage;
        self.time = parseTime(time: conversationInfo.lastMessage.date);
        
        if(!self.lastMesage.attachments.isEmpty && self.lastMesage.text.isEmpty){
            self.attachmentTextColor = Color.white;
        }
    }
    
    @Published var profileList: [ExtendedInfo] = [];
    @Published var conversationInfo: ConversationInfo;
    @Published var conversation: Conversation;
    @Published var lastMesage: Message;
    @Published var userName: String?;
    @Published var avatar: String?;
    @Published var isOnline: Bool = false;
    @Published var isOnlineString: String?;
    @Published var attachmentTextColor = Color.gray;
    @Published var userId: Int;
    @Published var chatType: ConversationType;
    // TODO: Заменить на настоящее время
    @Published var time: String = "22:02";
    
    func getUserInfo(){
        let user = self.profileList.first(where: {
            $0.id == self.userId;
        })
        
        if(user == nil){
            self.userName = "Неизвестно";
            self.avatar = defaultImage;
            self.isOnline = false;
            self.isOnlineString = "Неизвестно";
            return;
        }
        
        self.userName = user!.firstName + " " + user!.lastName;
        self.avatar = user!.photo100;
        
        self.isOnline = user!.online == 1;
//        self.isOnlineString = SwiftVK.createLastSeenString(lastSeenTime: user!.online, isOnline: (user?.online != nil), sex: user!.sex)
    }
    
    func getGroupInfo(){
        SwiftVKSingletone.shared.groups.getById(groupsIds: String(abs(userId)), groupId: nil, fields: nil){
            groups in
            self.userName = groups[0].name;
            self.avatar = groups[0].photo200;
            self.isOnline = false;
        }
    }
    
    func lastMesagePreview(lastMessage: Message) -> String{
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
        if(conversation.chatSettings?.title == nil && chatType == ConversationType.user){
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
