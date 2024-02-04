//
//  Dialogs.swift
//  IosApp
//
//  Created by Vladislav on 31.05.2023.
//

import Foundation
import SwiftUI

struct Dialog: Identifiable{
    var id: String { name };
    var name: String;
    var lastMessage: String;
    var image: String;
    var isOnline: Bool;
    var isReaded: Bool;
    var time: String?;
    var unreadCount: Int = 0;
}

var dialogs: [Dialog] = [
    Dialog(name: "Анна Иванова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: true)];

struct Message: Identifiable{
    var id: String { text };
    var text: String;
    var fromMe: Bool = true;
}

var messages: [Message] = [
    Message(text: "Привет, как дела?"),
    Message(text: "Как прошел день?"),
    Message(text: "Какие планы на выходные?"),
    Message(text: "Сегодня замечательная погода!"),
    Message(text: "Что нового у тебя?"),
    Message(text: "Какие новости в мире?"),
    Message(text: "Какие фильмы недавно посмотрел?"),
    Message(text: "Какие фильмы недавно посмотрел?"),
];
