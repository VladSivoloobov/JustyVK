import SwiftUI

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}

struct MessageList: View {
    @State var uiTabarController: UITabBarController?
    @State var name: String;
    @State var image: String;
    @State var messageList: [Message] = [];
    @EnvironmentObject var userInfo: UserInfo;
    @State var companionId: Int;
    var onlineStatusVisible: String?;
    var isOnline: Bool;

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
                                    message: message,
                                    fromMe: message.fromId == userInfo.id,
                                    time: "22:02"
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
                    .messageToolbar(name: name, image: image, onlineStatusVisible: onlineStatusVisible, isOnline: isOnline)
                }
                .getMessageList(scrollReader: scrollReader, messageList: $messageList, companionId: companionId)
                .padding(.bottom, -20)
            }
            .zIndex(1)
        }
        .onAppear(){
            SwiftVK.SwiftVKMessages.SwiftVKLongPoll.addEventListener(event: .newMessage){
                messageEvent in
                if let messageEvent = messageEvent as? NewMessageEvent{
                    if(messageEvent.peerId != companionId){
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
