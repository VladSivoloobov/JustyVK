//
//  MessageInput.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI

struct MessageInput: View {
    @State var messageText: String = "";
    
    var body: some View {
        HStack{
            Button{
                
            } label: {
                Image(systemName: "paperclip")
                    .foregroundColor(.gray)
                    .font(.system(size: 22))
            }
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(uiColor: UIColor.systemBackground))
                    .frame(maxHeight: 35)
                TextField("Сообщение", text: $messageText)
                    .padding(.horizontal, 10)
            }
            Button{
                
            } label: {
                Image(systemName: "mic")
                    .foregroundColor(.gray)
                    .font(.system(size: 22))
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .padding(.top, 10)
        .background(.ultraThinMaterial)
    }
}

struct MessageInput_Previews: PreviewProvider {
    static var previews: some View {
        MessageInput()
    }
}
