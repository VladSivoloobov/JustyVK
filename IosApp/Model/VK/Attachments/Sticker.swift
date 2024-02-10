struct Sticker: Decodable{
    var productId: Int;
    var stickerId: Int;
    var images: [StickerImage];
    var imagesWithBackground: [StickerImage]?;
    var animationUrl: String?;
    var isAllowed: Bool;
    
    struct StickerImage: Decodable{
        var url: String;
        var width: Int;
        var height: Int;
    }
    
    enum CodingKeys: String, CodingKey{
        case productId = "product_id";
        case stickerId = "sticker_id";
        case images;
        case imagesWithBackground = "images_with_background";
        case animationUrl = "animation_url";
        case isAllowed = "is_allowed";
    }
}
