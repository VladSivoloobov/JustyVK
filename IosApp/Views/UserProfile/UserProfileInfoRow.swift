//
//  UserProfileInfoRow.swift
//  Весточка
//
//  Created by Vladislav on 05.06.2023.
//

import SwiftUI

struct UserProfileInfoRow: View {
    @State var title: String;
    @State var text: Text;
    var body: some View {
        // TODO: Сделать возможность копирования статуса
        VStack(alignment: .leading, spacing: 2){
            Group{
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.light)
                text
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 28 / 255, green: 28 / 255, blue: 29 / 255))
        .cornerRadius(10)
    }
}
