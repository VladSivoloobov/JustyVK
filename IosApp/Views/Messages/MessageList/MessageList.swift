import SwiftUI

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}

struct MessageList: View {
    @State var messageList: [Message] = [];
    @EnvironmentObject var userInfo: UserInfo;
    @ObservedObject var dialogInfo: DialogModel;

    @ViewBuilder
    func Background() -> Image{
        let image = UIImage(named: "pattern-background")!;
        Image(uiImage: resizeImage(image: image, targetSize: CGSize(width: 1000, height: 600))!)
    }
    
    // TODO: Найти способ нормальной прокрутки scrollView при появлении клавиатуры
    var body: some View {
        ZStack{
            ScrollViewReader{ scrollReader in
                GeometryReader { reader in
                    ScrollView{
                        VStack(spacing: 4){
                            ForEach(0..<messageList.count, id: \.self){messageIndex in
                                let message = messageList.reversed()[messageIndex];
                                MessageCloud(
                                    messageModel: MessageModel(
                                        message: message,
                                        userId: userInfo.id!
                                    )
                                )
                                .id(messageIndex)
                            }
                        }
                        .frame(minHeight: reader.size.height - 20, alignment: .bottom)
                        .padding(.top, 10)
                        .padding(.bottom, 2)
                    }
                    .defaultScrollAnchor(.bottom)
                    .safeAreaInset(edge: .bottom){
                        MessageInput()
                    }
                    .messageToolbar(dialogInfo: dialogInfo)
                }
                .getMessageList(scrollReader: scrollReader, messageList: $messageList, companionId: dialogInfo.userId)
                .padding(.bottom, -20)
            }
            .zIndex(1)
        }
        .onAppear(){
            SwiftVK.SwiftVKMessages.SwiftVKLongPoll.addEventListener(event: .newMessage){
                messageEvent in
                if let messageEvent = messageEvent as? NewMessageEvent{
                    if(messageEvent.peerId != dialogInfo.userId){
                        return;
                    }
                    
                    let newMessage = Message(
                        date: messageEvent.timestamp,
                        fromId: Int(messageEvent.attachments?.from ?? "0")!,
                        text: messageEvent.text,
                        attachments: []
                    );
                    
                    print(newMessage);
                    
                    messageList.insert(newMessage, at: 0);
                }
            }
        }
    }
}
