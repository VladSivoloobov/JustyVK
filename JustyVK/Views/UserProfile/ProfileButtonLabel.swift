//
//  ProfileButtonLabel.swift
//  Весточка
//
//  Created by Vladislav on 04.06.2023.
//

import SwiftUI

struct ProfileButtonLabel: View {
    @State var systemImage: String;
    @State var title: String;
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            Image(systemName: systemImage)
                .font(.system(size: 19))
            // TODO: Изменить текст в зависимости от состояния
            Text(title)
                .font(.system(size: 11))
                .fontWeight(.medium)
        }
        .frame(width: 75, height: 58, alignment: .center)
        .background(Color(red: 28 / 255, green: 28 / 255, blue: 29 / 255))
        .cornerRadius(10)
    }
}
