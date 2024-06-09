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

    var body: some View {
        ZStack{
            ScrollViewReader{ scrollReader in
                GeometryReader { reader in
                    ScrollView{
                        VStack(spacing: 4){
                            ForEach(0..<messenger.messageList.count, id: \.self){
                                index in
                                let message = messenger.messageList.reversed()[index];
                                MessageItem(messageModel: MessageViewModel(
                                    message: message,
                                    userId: userInfo.id!,
                                    profilesList: messenger.profilesList
                                ), dialogInfo: dialogInfo)
                                .id(index)
                            }
                        }
                        .frame(minHeight: reader.size.height - 20,
                               alignment: .bottom)
                        .padding(.top, 10)
                        .padding(.bottom, 2)
                    }
                    .defaultScrollAnchor(.bottom)
                    .safeAreaInset(edge: .bottom){
                        MessageInput()
                    }
                    .messageToolbar(dialogInfo: dialogInfo)
                }
                .padding(.bottom, -20)
            }
            .zIndex(1)
        }
    }
}
