//
//  Online.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct UserOnlineStatus: View {
    @Binding var isOnline: Bool?;
    @State var width: CGFloat?;
    var body: some View {
        Circle()
            .frame(width: width ?? 10)
            .foregroundColor(isOnline ?? false ? .green : .clear)
            .overlay{
                Circle().stroke(isOnline ?? false ? .black : .clear, lineWidth: 2)
            }
    }
}
