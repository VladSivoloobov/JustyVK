import SwiftUI

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}

struct MessengerPage: View {
    @EnvironmentObject var userInfo: UserInfo;
    @ObservedObject var dialogInfo: DialogViewModel;
    @StateObject var messenger: MessengerViewModel;
    @State private var keyboardHeight: CGFloat = 0
    
    func checkNextMessage(message: Message, index: Int) -> Bool{
        let nextIndex = index + 1;
        var nextMessage: Message;
        
        if messenger.messageList.indices.contains(nextIndex){
            nextMessage = messenger.messageList.reversed()[nextIndex];
            
            if(message.fromId == nextMessage.fromId){
                return false;
            }
        }
        
        return true;
    }

    var body: some View {
        ZStack{
            ScrollViewReader{ scrollReader in
                GeometryReader { reader in
                    ScrollView{
                        VStack(spacing: 6){
                            ForEach(0..<messenger.messageList.count, id: \.self){
                                index in
                                let message = messenger.messageList.reversed()[index];
                                let nextSame = checkNextMessage(message: message, index: index);
                                
                                MessageItem(messageModel: MessageViewModel(
                                    message: message,
                                    userId: userInfo.id!,
                                    profilesList: messenger.profilesList
                                ), dialogInfo: dialogInfo,
                                   nextSame: nextSame)
                                .padding(.bottom, nextSame ? 4 : 0)
                                .id(index)
                            }
                        }
                        .frame(minHeight: reader.size.height - 20,
                               alignment: .bottom)
                        .padding(.top, 10)
                        .padding(.bottom, 2)
                        .keyboardHeight($keyboardHeight)
                        .animation(.easeInOut, value: keyboardHeight)
                        .offset(y: -keyboardHeight / 2 == 0 ? -keyboardHeight / 2 : -keyboardHeight / 2 - 150)
                    }
                    .scrollDismissesKeyboard(.interactively)
                    .defaultScrollAnchor(.bottom)
                    .safeAreaInset(edge: .bottom){
                        MessageInput()
                            .offset(y: -keyboardHeight == 0 ? -keyboardHeight : -keyboardHeight + 30)
                            .animation(.easeInOut, value: keyboardHeight)
                    }
                    .messageToolbar(dialogInfo: dialogInfo)
                    .ignoresSafeArea(.keyboard)
                }
                .padding(.bottom, -20)
                .ignoresSafeArea(.keyboard)
            }
            .ignoresSafeArea(.keyboard)
            .zIndex(1)
        }
    }
}
