struct NewMessageEvent: LongPollEvent{
    var eventId: LongPollUpdates = .newMessage;
    var messageId: Int;
    var flags: Int;
    var minorId: Int;
    var peerId: Int;
    var timestamp: Int;
    var text: String;
    var attachments: LongPollAttachments?;
}
