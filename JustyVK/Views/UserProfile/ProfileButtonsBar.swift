//
//  ProfileButtonsBar.swift
//  Весточка
//
//  Created by Vladislav on 04.06.2023.
//

import SwiftUI

struct ProfileButtonsBar: View {
    var body: some View {
        // TODO: Исправить размеры для 14 айфона
        HStack{
            Group{
                Button{
                    // TODO: Добавить логику добавления и удаления из друзей
                } label: {
                    ProfileButtonLabel(systemImage: "person.fill.checkmark", title: "Друзья")
                }
                Spacer()
            }
            Group{
                Button{
                    // TODO: Добавить логику включения и выключения уведомлений
                } label: {
                    ProfileButtonLabel(systemImage: "bell.fill", title: "Уведомл.")
                }
                Spacer()
            }
            Group{
                Button{
                    // TODO: Добавить логику поиска сообщений
                } label: {
                    ProfileButtonLabel(systemImage: "magnifyingglass", title: "Поиск")
                }
                Spacer()
            }
            Group{
                Menu{
                    Button{
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Добавить в закладки", systemImage: "star")
                    }
                    Button{
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Закрепить", systemImage: "pin")
                    }
                    Button{
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Поделиться", systemImage: "square.and.arrow.up")
                    }
                    Button{
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Архивировать", systemImage: "archivebox")
                    }
                    Button(role: .destructive){
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Пожаловаться", systemImage: "exclamationmark.bubble")
                    }
                    Button(role: .destructive){
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Удалить переписку", systemImage: "trash")
                    }
                    Button(role: .destructive){
                        // TODO: Сделать эту кнопку рабочей
                    } label: {
                        Label("Добавить в черный список", systemImage: "book.closed")
                    }
                } label: {
                    ProfileButtonLabel(systemImage: "ellipsis.circle", title: "Ещё")
                }
            }
        }
    }
}

struct ProfileButtonsBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonsBar()
    }
}
