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
    @State var messageList: [VKMesage] = [];
    @EnvironmentObject var userInfo: UserInfo;
    @State var companionId: Int;
    
    func hideKeyboardWithAnimation(_ scrollReader: ScrollViewProxy){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            withAnimation(.easeIn(duration: 0.5)) {
                scrollReader.scrollTo(messages.count - 1, anchor: .bottom)
            }
        }
    }
    
    // TODO: Найти способ нормальной прокрутки scrollView при появлении клавиатуры
    var body: some View {
        ScrollViewReader{ scrollReader in
            GeometryReader { reader in
                ScrollView{
                    VStack(spacing: 4){
                        ForEach(0..<messageList.count, id: \.self){messageIndex in
                            let message = messageList[messageIndex];
                            MessageCloud(
                                messageText: message.text,
                                time: "22:02",
                                fromMe: message.fromId == userInfo.id
                            )
                            .id(messageIndex)
                        }
                    }
                    .frame(minHeight: reader.size.height - 20, alignment: .bottom)
                    .padding(.top, 10)
                    .padding(.bottom, 2)
                    .onTapGesture(perform: UIApplication.shared.endEditing)
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                UIApplication.shared.endEditing()
                            }
                            .onEnded { _ in
                                UIApplication.shared.endEditing()
                            }
                    )
                }
                .safeAreaInset(edge: .bottom){
                    MessageInput()
                }
                .messageToolbar(name: name, image: image)
            }
            .getMessageList(scrollReader: scrollReader, messageList: $messageList, companionId: 428156427)
            .onReceive(NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillShowNotification
            )){ _ in
                hideKeyboardWithAnimation(scrollReader);
            }
            .onReceive(NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillHideNotification
            )){ _ in
                hideKeyboardWithAnimation(scrollReader);
            }
            .padding(.bottom, -20)
        }
    }
}
