import Foundation

class MessageModel: ObservableObject{
    init(message: Message, userId: Int) {
        self.message = message;
        self.fromMe = message.fromId == userId;
        // TODO: Поменять время на настоящее
        self.time = "22:02";
        self.isAttachment = !message.attachments.isEmpty;
        self.attachmentsCount = message.attachments.count;
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
    }
    
    @Published var message: Message;
    @Published var fromMe: Bool;
    @Published var time: String = "22:02";
    @Published var isSticker: Bool;
    @Published var lastSticker: Sticker?;
    @Published var isAnimatedSticker: Bool = false;
    @Published var isAttachment: Bool;
    @Published var attachmentsCount: Int;
}
