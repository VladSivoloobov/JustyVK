//
//  PushSettings.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 08.06.2024.
//

import Foundation

struct PushSettings: Decodable {
    var disabledUntil: Int?;
    var disabledForever: Bool;
    var noSound: Bool;
    
    enum CodingKeys: String, CodingKey{
        case disabledUntil = "disabled_until";
        case disabledForever = "disabled_forever";
        case noSound = "no_sound";
    }
}
