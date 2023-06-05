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
                    .padding(.bottom, 74)
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
            .padding(.bottom, -20)
            .overlay(alignment: .bottom){
                MessageInput()
            }
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
