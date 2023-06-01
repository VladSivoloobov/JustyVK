//
//  SendedMessage.swift
//  IosApp
//
//  Created by Vladislav on 01.06.2023.
//

import SwiftUI

struct SendedMessage: View {
    var messageText: String;
    var time: String;
    var fromMe: Bool = true;
    
    var body: some View {
        Group{
            Group{
                HStack(alignment: .bottom){
                    Group{
                        Text(messageText)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(time)
                            .font(Font.system(size: 10))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(fromMe ? Color.blue : Color.gray)
                .cornerRadius(15)
                .compositingGroup()
                .contextMenu{
                    Button{
                        /* Логика копирования */
                        
                    } label: {
                        Label("Скопировать", systemImage: "doc.on.doc")
                    }
                    Button{
                        /* Логика ответа */
                        
                    } label : {
                        Label("Ответить", systemImage: "arrowshape.turn.up.left")
                    }
                    Button{
                        /* Логика пересылки */
                        
                    } label : {
                        Label("Переслать", systemImage: "arrowshape.turn.up.left.2")
                    }
                    Button(role: .destructive){
                        /* Логика пересылки */
                        
                    } label : {
                        Label("Удалить", systemImage: "trash")
                    }
                }
            }
            .frame(maxWidth: 300, alignment: fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: fromMe ? .trailing : .leading)
        .padding(.horizontal, 7)
    }
}

struct SendedMessage_Previews: PreviewProvider {
    static var previews: some View {
        SendedMessage(messageText: "Привет", time: "22:02")
    }
}
