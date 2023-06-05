//
//  HorizontalProfileAttachments.swift
//  Весточка
//
//  Created by Vladislav on 04.06.2023.
//

import SwiftUI

struct HorizontalProfileAttachments: View {
    // TODO: Доделать этот компонент
    var body: some View {
        HStack{
            Spacer()
            Button{
                // TODO: Сделать активной эту кнопку
            } label: {
                HStack{
                    Image(systemName: "photo")
                    Text("Фото")
                }
            }
            Spacer()
            Button{
                // TODO: Сделать активной эту кнопку
            } label: {
                HStack{
                    Image(systemName: "video")
                    Text("Видео")
                }
            }
            Spacer()
            Button{
                // TODO: Сделать активной эту кнопку
            } label: {
                HStack{
                    Image(systemName: "archivebox")
                    Text("Файлы")
                }
            }
            Spacer()
        }
        .background(Color(red: 28 / 255, green: 28 / 255, blue: 29 / 255))
    }
}

struct HorizontalProfileAttachments_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProfileAttachments()
    }
}
