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
    Dialog(name: "Анна Иванова", lastMessage: "Привет", image: "Avatar", isOnline: true, isReaded: true),
    Dialog(name: "Иван Петров", lastMessage: "Она просто дура", image: "Avatar2", isOnline: false, isReaded: false),
    Dialog(name: "Мария Сидорова", lastMessage: "Не знаю", image: "Avatar3", isOnline: false, isReaded: false),
    Dialog(name: "Алексей Кузнецов", lastMessage: "Как дела?", image: "Avatar4", isOnline: false, isReaded: true),
    Dialog(name: "Елена Николаева", lastMessage: "Давай познакомимся, красавчик", image: "Avatar5", isOnline: false, isReaded: false),
    Dialog(name: "Николай Ивановичев", lastMessage: "Извини", image: "Avatar7", isOnline: false, isReaded: false),
    Dialog(name: "Ольга Смирнова", lastMessage: "Да ладно тебе, я итак знаю про созданных тварей в афганском приводе, и всё же непонятно только одно, как это возможно", image: "Avatar6", isOnline: false, isReaded: false),
    Dialog(name: "Дмитрий Козлов", lastMessage: "ахаххаххах", image: "Avatar8", isOnline: false, isReaded: false)
];

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
    Message(text: "Какой твой любимый вид спорта?"),
    Message(text: "Что ты обычно ешь на завтрак?"),
    Message(text: "Какой твой любимый город?"),
    Message(text: "Какой твой любимый цвет?"),
    Message(text: "Какой твой любимый актер/актриса?"),
    Message(text: "Какой твой любимый жанр музыки?"),
    Message(text: "Какой твой любимый художник?"),
    Message(text: "Что ты думаешь о политике?"),
    Message(text: "Какой твой любимый ресторан?"),
    Message(text: "Какой твой любимый вид транспорта?"),
    Message(text: "Какая книга недавно понравилась?"),
    Message(text: "Какой твой любимый вид животных?"),
    Message(text: "Что ты обычно делаешь в свободное время?"),
    Message(text: "Какой твой любимый фильм?"),
    Message(text: "Что тебе нравится в своей работе?"),
    Message(text: "Какие у тебя планы на будущее?"),
    Message(text: "Что тебе нравится в своем городе?"),
    Message(text: "Какой твой любимый вид спорта для занятий?"),
    Message(text: "Какой твой любимый музыкальный инструмент?"),
    Message(text: "Какой твой любимый вид техники?"),
    Message(text: "Какой твой любимый вид танцев?"),
    Message(text: "Какой твой любимый вид спортивных соревнований?"),
    Message(text: "Какой твой любимый вид морепродуктов?"),
    Message(text: "Какой твой любимый вид фруктов?"),
    Message(text: "Что ты думаешь о путешествиях?"),
    Message(text: "Какой твой любимый вид кино?"),
    Message(text: "Какой твой любимый вид книг?"),
    Message(text: "Какой твой любимый вид напитков?"),
    Message(text: "Какой твой любимый вид специй?"),
    Message(text: "Что тебе нравится в своих друзьях?"),
    Message(text: "Какой твой любимый вид обуви?"),
    Message(text: "Что тебе нравится в своей семье?"),
    Message(text: "Какой твой любимый вид одежды?"),
    Message(text: "Какой твой любимый вид аксессуаров?"),
    Message(text: "Что ты думаешь о новых технологиях?"),
    Message(text: "Какой твой любимый вид мяса?"),
    Message(text: "Что тебе нравится в своей жизни?"),
    Message(text: "Какой твой любимый вид рыбы?"),
    Message(text: "Что ты думаешь о религии?"),
    Message(text: "Какой твой любимый вид кулинарии?"),
    Message(text: "Какой твой любимый вид направления в искусстве?"),
    Message(text: "Что тебе нравится в своих коллегах?"),
    Message(text: "Какой твой любимый вид цветов?"),
    Message(text: "Какой твой любимый вид фотографии?"),
    Message(text: "Какой твой любимый вид путешествий?"),
    Message(text: "Что тебе нравится в своей жизни больше всего?"),
    Message(text: "Какой твой любимый вид спортивной экипировки?"),
    Message(text: "Какой твой любимый вид блюд на гриле?"),
    Message(text: "Что ты думаешь о спортивных соревнованиях?"),
    Message(text: "Какой твой любимый вид снеков?"),
    Message(text: "Какой твой любимый вид десертов?"),
    Message(text: "Какой твой любимый вид кофе?"),
    Message(text: "Что тебе нравится в своей квартире/доме?"),
    Message(text: "Какой твой любимый вид чая?"),
    Message(text: "Какой твой любимый вид рисовых блюд?"),
    Message(text: "Что ты думаешь о здоровом образе жизни?"),
    Message(text: "Какой твой любимый вид мороженого?"),
    Message(text: "Какой твой любимый вид пива?"),
    Message(text: "Что тебе нравится в своей работе больше всего?"),
    Message(text: "Какой твой любимый вид фруктовых салатов?"),
    Message(text: "Какой твой любимый вид супов?"),
    Message(text: "Какой твой любимый вид мясных блюд?"),
    Message(text: "Что ты думаешь о семейных ценностях?"),
    Message(text: "Какой твой любимый вид коктейлей?"),
    Message(text: "Какой твой любимый вид закусок?"),
    Message(text: "Какой твой любимый вид сладостей?"),
    Message(text: "Что тебе нравится в своих увлечениях?"),
    Message(text: "Какой твой любимый вид морепродуктовых салатов?"),
    Message(text: "Какой твой любимый вид пасты?"),
    Message(text: "Какой твой любимый вид овощей?"),
    Message(text: "Какой твой любимый вид спортивной обуви?"),
    Message(text: "Что ты думаешь о экологии?"),
    Message(text: "Какой твой любимый вид салатов?"),
    Message(text: "Какой твой любимый вид морских гадов?"),
    Message(text: "Что тебе нравится в своей личной жизни?"),
    Message(text: "Какой твой любимый вид морских фруктов?"),
    Message(text: "Пиздец ты настрочил", fromMe: false)
];
