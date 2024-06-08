//
//  ChatSettings.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 08.06.2024.
//

import Foundation

struct ChatSettings: Decodable {
    var membersCount: Int;
    var title: String?;
    var pinnedMessage: PinnedMessage?;
    var state: ChatState;
    var photo: ChatPhoto;
    var activeIds: [Int];
    var isGroupChannel: Bool;
    
    enum CodingKeys: String, CodingKey {
        case membersCount = "members_count";
        case title;
        case pinnedMessage = "pinned_message";
        case state;
        case photo;
        case activeIds = "active_ids";
        case isGroupChannel = "is_group_channel";
    }
}

enum ChatState: String, Decodable {
    case inChat = "in";
    case kicked;
    case left;
}
