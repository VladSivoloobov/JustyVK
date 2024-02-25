//
//  MessageTime.swift
//  Весточка
//
//  Created by  Владислав on 17.02.2024.
//

import SwiftUI

struct MessageTime: View {
    var messageTime: String;
    var body: some View {
        Text(messageTime)
            .font(Font.system(size: 10))
            .foregroundColor(.white)
    }
}
