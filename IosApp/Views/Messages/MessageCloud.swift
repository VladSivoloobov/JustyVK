//
//  SendedMessage.swift
//  IosApp
//
//  Created by Vladislav on 01.06.2023.
//

import SwiftUI

struct MessageCloud: View {
    var messageText: String;
    var time: String;
    var fromMe: Bool = true;
    
    var body: some View {
        Group{
            Group{
                HStack(alignment: .bottom){
                    Group{
                        Text(messageText)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(time)
                            .font(Font.system(size: 10))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(
                    fromMe
                    ? Color.blue
                    : Color(red: 35 / 255, green: 35 / 255, blue: 36 / 255)
                )
                .cornerRadius(15)
                .compositingGroup()
                .contextMenu{
                    Button{
                        // TODO: Добавить возможность копирования текста сообщения в буфер обмена
                        
                    } label: {
                        Label("Скопировать", systemImage: "doc.on.doc")
                    }
                    Button{
                        // TODO: Добавить возможность ответа на сообщение в текущем диалоге
                        
                    } label : {
                        Label("Ответить", systemImage: "arrowshape.turn.up.left")
                    }
                    Button{
                        // TODO: Добавить возможность пересылки сообщения в другой диалог
                        
                    } label : {
                        Label("Переслать", systemImage: "arrowshape.turn.up.left.2")
                    }
                    Button(role: .destructive){
                        // TODO: Добавить возможность удаления сообщения для одного или обоих участников
                        
                    } label : {
                        Label("Удалить", systemImage: "trash")
                    }
                }
            }
            .frame(maxWidth: 300, alignment: fromMe ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: fromMe ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}

struct SendedMessage_Previews: PreviewProvider {
    static var previews: some View {
        MessageCloud(messageText: "Привет", time: "22:02", fromMe: false)
    }
}
