//
//  Photo.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 08.06.2024.
//

import Foundation

struct ChatPhoto: Decodable {
    var photo50: String;
    var photo100: String;
    var photo200: String;
    var photoBase: String?;
    
    enum CodingKeys: String, CodingKey {
        case photo50 = "photo_50";
        case photo100 = "photo_100";
        case photo200 = "photo_200";
        case photoBase = "photo_base";
    }
}
