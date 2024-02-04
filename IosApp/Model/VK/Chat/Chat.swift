struct Chat: Decodable{
    var title: String;
    var membersCount: Int;
    var ownerId: Int;
    var description: String;
    var pinnedMessageCount: Int;
    var pinnedMessage: PinnedMessage;
    var state: String;
    var photo: ChatPhoto;
    var activeIds: [Int];
    var isGroupChannel: Bool;
    var acl: ChatAcl;
    var isDisappearing: Bool;
    var isService: Bool;
    var typeMask: Int;
    var shortPollReactions: Bool;
    
    enum CodingKeys: String, CodingKey{
        case title;
        case membersCount = "members_count";
        case ownerId = "owner_id";
        case description;
        case pinnedMessageCount = "pinned_message_count";
        case pinnedMessage = "pinned_message";
        case state;
        case photo;
        case activeIds = "active_ids";
        case isGroupChannel = "is_group_channel";
        case acl;
        case isDisappearing = "is_disappearing";
        case isService = "is_service";
        case typeMask = "type_mask";
        case shortPollReactions = "shortPollReactions";
    }
    
    struct ChatAcl: Decodable{
        var canChangeInfo: Bool;
        var canChangeInviteLink: Bool;
        var canChangePin: Bool;
        var canInvite: Bool;
        var canPromoteUsers: Bool;
        var canSeeInviteLink: Bool;
        var canModerate: Bool;
        var canCopyChat: Bool;
        var canCall: Bool;
        var canUseMassMentions: Bool;
        var canChangeStyle: Bool;
        var canSendReactions: Bool;
        
        enum CodingKeys: String, CodingKey{
            case canChangeInfo = "can_change_info";
            case canChangeInviteLink = "can_change_invite_link";
            case canChangePin = "can_change_pin";
            case canInvite = "can_invite";
            case canPromoteUsers = "can_promote_users";
            case canSeeInviteLink = "can_see_invite_link";
            case canModerate = "can_moderate";
            case canCopyChat = "can_copy_chat";
            case canCall = "can_call";
            case canUseMassMentions = "can_use_mass_mentions";
            case canChangeStyle = "can_change_style";
            case canSendReactions = "can_send_reactions";
        }
    }
    
    struct ChatPhoto: Decodable{
        var photo50: String;
        var photo100: String;
        var photo200: String;
        var isDefaultPhoto: Bool;
        var isDefaultCallPhoto: Bool;
        
        enum CodingKeys: String, CodingKey{
            case photo50 = "photo_50";
            case photo100 = "photo_100";
            case photo200 = "photo_200";
            case isDefaultPhoto = "is_default_photo";
            case isDefaultCallPhoto = "is_default_call_photo";
        }
    }
}
