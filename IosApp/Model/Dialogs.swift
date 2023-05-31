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
}

var dialogs: [Dialog] = [
    Dialog(name: "Анна Гростимова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Анна Гростимова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Анна Гростимова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Анна Гростимова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Анна Гростимова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Серега Кулимов", lastMessage: "Вы: Не знаю", image: "Avatar2", isOnline: false, isReaded: false),
]
