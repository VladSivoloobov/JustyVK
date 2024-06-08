//
//  CanWrite.swift
//  JustyVK
//
//  Created by Влад Сиволобов on 08.06.2024.
//

import Foundation

struct CanWrite: Decodable {
    var allowed: Bool;
    var reason: Int?;
}

enum DisabledWriteReason: Int, Decodable {
    case deleted = 18;
    case blacklisted = 900;
    case disabledFromGroup = 901;
    case disabledMessagesInGroup = 915;
    case blockedMessagesInGroup = 916;
    case notHavePermissionsToChat = 917;
    case notHaveEmail = 918;
    case notHaveGroup = 203;
}
