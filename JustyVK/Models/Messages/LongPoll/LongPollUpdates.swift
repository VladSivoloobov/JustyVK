enum LongPollUpdates: Int{
    case changeMessageFlags = 1;
    case setMessageFlags;
    case resetMessageFlags;
    case newMessage;
    case editMessage;
    case readIncomingMessages;
    case readOutcomingMessages;
    case friendIsOnline;
    case friendIsOffline;
    case resetDialogFlags;
    case changeDialogFlags;
    case setDialogFlags;
    case removeAllMessages;
    case recoeryAllRecentDeletedMessages;
    case changedMajorIdInDialog = 20;
    case changedMinorIdInDialog;
    case changedParameterOfConversation = 51;
    case changedInformationOfChat;
    case userIsTypingInDialog = 61;
    case userIsTypingInChat;
    case usersIsTypingInChat;
    case counterEqualCount = 80;
    case changedSettingsOfNotifications = 114;
    
}
