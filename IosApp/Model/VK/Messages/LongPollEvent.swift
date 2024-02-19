struct LongPollEvent: Codable {
    let ts: Int
    let updates: [[LongPollUpdate]]
}

enum LongPollUpdate: Codable {
    case integer(Int)
    case string(String)
    case longPollAttachments(LongPollAttachments)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(LongPollAttachments.self) {
            self = .longPollAttachments(x)
            return
        }
        throw DecodingError.typeMismatch(LongPollUpdate.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for LongPollUpdate"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .longPollAttachments(let x):
            try container.encode(x)
        }
    }
}

struct LongPollAttachments: Codable {
    let attach1Type, attach1, clientPlatformInfo, from: String?;

    enum CodingKeys: String, CodingKey {
        case attach1Type = "attach1_type"
        case attach1
        case clientPlatformInfo = "client_platform_info"
        case from
    }
}
