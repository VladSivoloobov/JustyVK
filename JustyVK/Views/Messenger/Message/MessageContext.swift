import SwiftUI

struct MessageContext: ViewModifier{
    func body(content: Content) -> some View{
        content
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
}

extension View {
    func messageContextMenu() -> some View{
        modifier(MessageContext());
    }
}
