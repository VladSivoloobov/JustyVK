//
//  MessageTime.swift
//  Весточка
//
//  Created by  Владислав on 17.02.2024.
//

import SwiftUI

struct MessageTime: View {
    var time: String;
    var body: some View {
        Text(time)
            .font(Font.system(size: 10))
            .foregroundColor(.white)
    }
}
