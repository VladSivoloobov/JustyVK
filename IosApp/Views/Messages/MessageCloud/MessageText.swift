//
//  MessageText.swift
//  Весточка
//
//  Created by  Владислав on 17.02.2024.
//

import SwiftUI

struct MessageText: View {
    @ObservedObject var messageModel: MessageModel;
    
    var body: some View {
        HStack(alignment: .bottom){
            if(!messageModel.message.text.isEmpty){
                Text(messageModel.message.text)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
            if(!messageModel.message.attachments.isEmpty){
                Spacer();
                MessageTime(time: messageModel.time);
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
    }
}
