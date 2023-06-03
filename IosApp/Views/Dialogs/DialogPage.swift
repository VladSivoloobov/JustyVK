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

struct DialogPage: View {
    @State var uiTabarController: UITabBarController?
    var name: String;
    var image: String;
    
    var body: some View {
        ScrollViewReader{ scrollReader in
            GeometryReader { reader in
                ZStack(){
                    ScrollView{
                        VStack(spacing: 4){
                            ForEach(0..<messages.count, id: \.self){messageIndex in
                                let message = messages[messageIndex];
                                SendedMessage(
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
                            Navbar(name: name)
                        }
                    }
                    .toolbarBackground(.visible, for: .navigationBar)
                }
                .onAppear{
                    // В будущем поменять логику
                    scrollReader.scrollTo(messages.count - 1)
                }
                .padding(.bottom, -20)
                
                VStack{
                    Spacer()
                    MessageInput()
                        .offset(y: 10)
                }
            }
        }
    }
}

struct DialogPage_Previews: PreviewProvider {
    static var previews: some View {
        DialogPage(name: "Анна Гростимова", image: "Avatar")
            .previewLayout(.fixed(width: 320, height: 600))
            .padding(.vertical, 10)
    }
}
