import Foundation

class MessageViewModel: ObservableObject{
    init(message: Message, userId: Int, profilesList: [MessageProfileInfo] = []) {
        self.message = message;
        self.fromId = message.fromId;
        self.fromMe = message.fromId == userId;
        self.userId = userId;
        // TODO: Починить время
        self.time = parseTime(time: message.date);
        self.isAttachment = !message.attachments.isEmpty;
        self.attachmentsCount = message.attachments.count;
        self.profilesList = profilesList;
        
        if(message.attachments.count > 0){
            self.isSticker = message.attachments[0].sticker != nil;
            if(self.isSticker){
                self.isAnimatedSticker = message.attachments[0].sticker?.animationUrl != nil;
            }
            self.lastSticker = message.attachments[0].sticker;
        }
        else{
            self.isSticker = false;
        }
        
        SwiftVKSingletone.shared.photos.get(ownerId: String(message.fromId), albumId: "profile"){
            photo in
            self.avatar = photo[0].sizes.last?.url ?? defaultImage
        }
    }
    
    @Published var message: Message;
    @Published var fromMe: Bool;
    @Published var time: String = "22:02";
    @Published var isSticker: Bool;
    @Published var lastSticker: Sticker?;
    @Published var isAnimatedSticker: Bool = false;
    @Published var isAttachment: Bool;
    @Published var attachmentsCount: Int;
    @Published var messageList: [Message] = [];
    @Published var userId: Int;
    @Published var avatar: String = defaultImage;
    @Published var profilesList: [MessageProfileInfo];
    @Published var fromId: Int;
}
