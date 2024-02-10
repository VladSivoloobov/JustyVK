import Foundation

struct Attachment: Decodable {
    var type: String;
    var photo: Photo?;
    var video: Video?;
    var sticker: Sticker?;
}
