//
//  AttachmentsGrid.swift
//  Весточка
//
//  Created by  Владислав on 16.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct AttachmentsGrid: View {
    var message: Message;
    
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
        let messageRows = createSubarraysArray(arr: message.attachments, byNumber: 1);
        Grid(horizontalSpacing: 2, verticalSpacing: 2){
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
        .cornerRadius(15)
    }
}
