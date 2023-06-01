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
    var name: String;
    var image: String;
    
    var body: some View {
        GeometryReader { reader in
            ScrollView{
                VStack(spacing: 4){
                    ForEach(messages){message in
                        SendedMessage(messageText: message.text, time: "22:02", fromMe: message.fromMe)
                    }
                }
                .frame(minHeight: reader.size.height - 20, alignment: .bottom)
                .padding(.vertical, 20)
                .padding(.top, 30)
                .padding(.leading, 7)
            }
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
                    VStack{
                        Text(name)
                            .fontWeight(.medium)
                        Text("онлайн")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
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
