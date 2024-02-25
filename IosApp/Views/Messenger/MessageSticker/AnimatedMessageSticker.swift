import SwiftUI

struct AnimatedMessageSticker: View{
    var sticker: Sticker;
    
    // TODO: Добавить кэширование анимированных стикеров
    // TODO: При скролле остановить анимацию
    
    var body: some View{
        LottieView(filePath: sticker.animationUrl ?? "", loop: true)
            .stickerSizes()
    }
}
