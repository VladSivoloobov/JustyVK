import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageCloudContent: View {
    var isSticker: Bool;
    var isAnimatedSticker: Bool;
    var message: Message;
    var lastSticker: Sticker?;
    var time: String;
    
    func createSubarraysArray<T>(arr: [T], byNumber: Int) -> [[T]]{
        var array: [[T]] = [];
        
        for i in stride(from: 0, to: arr.count, by: byNumber + 1){
            if(i + byNumber >= arr.count - 1){
                array.append(Array(arr[i...arr.count - 1]));
                break;
            }
            array.append(Array(arr[i...i + byNumber]));
        }
        
        return array;
    }
    
    var body: some View {
        Group{
            VStack{
                if(isSticker){
                    if(!isAnimatedSticker){
                        MessageSticker(url: lastSticker?.images.last?.url);
                    }
                    else{
                        AnimatedMessageSticker(sticker: lastSticker!)
                    }
                } else{
                    if(!message.attachments.isEmpty){
                        let messageRows = createSubarraysArray(arr: message.attachments, byNumber: 1);
                        Grid{
                            ForEach(0..<messageRows.count, id: \.self){ i in
                                let attachmentRow = messageRows[i];
                                GridRow{
                                    ForEach(0..<attachmentRow.count, id: \.self){ attachmentItem in
                                        let attachment = attachmentRow[attachmentItem];
                                        if(attachment.type == "photo"){
                                            WebImage(url: URL(string: attachment.photo!.sizes.last!.url))
                                                .resizable()
                                                .scaledToFill()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Text(message.text)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Text(time)
                .font(Font.system(size: 10))
                .foregroundColor(.white)
        }
    }
}
