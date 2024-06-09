//
//  MessageProfileInfo.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 09.06.2024.
//

import Foundation

class MessageProfileInfo: Decodable {
    var id: Int;
    var sex: Int?;
    var screenName: String;
    var photo50: String;
    var photo100: String;
    var onlineInfo: OnlineInfo;
    var online: Int?;
    var firstName: String;
    var lastName: String;
    var canAccessClosed: Bool;
    var isClosed: Bool;
    
    enum CodingKeys: String, CodingKey {
        case id;
        case sex;
        case screenName = "screen_name";
        case photo50 = "photo_50";
        case photo100 = "photo_100";
        case onlineInfo = "online_info";
        case online;
        case firstName = "first_name";
        case lastName = "last_name";
        case canAccessClosed = "can_access_closed";
        case isClosed = "is_closed";
    }
}
