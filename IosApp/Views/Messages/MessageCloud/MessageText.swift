//
//  MessageText.swift
//  Весточка
//
//  Created by  Владислав on 17.02.2024.
//

import SwiftUI

struct MessageText: View {
    var message: Message;
    var time: String;
    var body: some View {
        HStack(alignment: .bottom){
            if(!message.text.isEmpty){
                Text(message.text)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
            if(!message.attachments.isEmpty){
                Spacer();
                MessageTime(time: time);
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
}
