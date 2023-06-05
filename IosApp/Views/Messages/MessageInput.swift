//
//  MessageInput.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI
import PhotosUI

struct MessageInput: View {
    @State var messageText: String = "";
    @State var photosPickerIsActive: Bool = false;
    @State var selectedPhotos = [Image]();
    @State var selectedPhotosItems = [PhotosPickerItem]();
    
    var body: some View {
        HStack(alignment: .bottom){
            // TODO: Реализовать прикрепление и отправку вложений на сервер вк через vk api
            PhotosPicker(
                selection: $selectedPhotosItems,
                matching: .any(of: [.images, .videos])
            ){
                Image(systemName: "paperclip")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
            }
            
            TextField("Сообщение", text: $messageText, axis: .vertical)
            .padding(.horizontal, 10)
            .lineLimit(0...30)
            .frame(minHeight: 20, maxHeight: 180)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(uiColor: UIColor.systemBackground))
                    .padding(.vertical, -2)
        
            )
            if messageText.isEmpty {
                Button{
                    // TODO: Добавить возможность отправки стикеров через боттом шит
                } label: {
                    Image(systemName: "face.smiling")
                        .foregroundColor(.gray)
                        .font(.system(size: 25))
                }
                Button{
                    // TODO: Добавить возможность отправки голосовых сообщений и видеосообщений
                } label: {
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                        .font(.system(size: 25))
                }
            }
            else {
                Button {
                    // TODO: Добавить возможность отправки сообщений
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 27))
                        .foregroundColor(.blue)
                }
            }
        }
        .animation(.easeOut(duration: 0.1), value: messageText)
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .background(.ultraThinMaterial)
    }
}

struct MessageInput_Previews: PreviewProvider {
    static var previews: some View {
        MessageInput()
    }
}
