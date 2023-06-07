//
//  DialogPage.swift
//  IosApp
//
//  Created by Vladislav on 31.05.2023.
//

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
                        ForEach(0..<messages.count, id: \.self){messageIndex in
                            let message = messages[messageIndex];
                            MessageCloud(
                                messageText: message.text,
                                time: "22:02",
                                fromMe: message.fromMe
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
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(image)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .cornerRadius(.infinity)
                            .padding(.trailing, 5)
                    }
                    ToolbarItem(placement: .principal){
                        MessageNavbar(name: name)
                    }
                }
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .onAppear{
                // TODO: При взаимодействии с api изменить скролл
                scrollReader.scrollTo(messages.count - 1)
            }
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

struct DialogPage_Previews: PreviewProvider {
    static var previews: some View {
        MessageList(name: "Анна Гростимова", image: "Avatar")
            .previewLayout(.fixed(width: 320, height: 600))
            .padding(.vertical, 10)
    }
}
