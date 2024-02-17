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
    
    var body: some View {
        let messageRows = SwiftVK.createAttachmentMatrix(arr: message.attachments, byNumber: 1);
        VStack(spacing: 2){
            ForEach(0..<messageRows.count, id: \.self){ i in
                let attachmentRow = messageRows[i];
                HStack(spacing: 2){
                    ForEach(0..<attachmentRow.count, id: \.self){ attachmentItem in
                        let attachment = attachmentRow[attachmentItem];
                        if(attachment.type == "photo"){
                            AttachmentImage(attachment: attachment)
                                .frame(minWidth: nil, idealWidth: nil, maxWidth: nil, minHeight: nil, idealHeight: nil, maxHeight: 500, alignment: .center)
                        }
                    }
                }
            }
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: 296, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
        .cornerRadius(15)
    }
}
