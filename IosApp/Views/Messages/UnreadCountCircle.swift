//
//  UnreadCountCircle.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI

struct UnreadCountCircle: View {
    @State var count: Int;
    var body: some View {
        Text("\(count)")
            .padding(.all, 5)
            .background(Color.blue)
            .cornerRadius(.infinity)
            .foregroundColor(.white)
            .fontWeight(.bold)
    }
}

struct UnreadCountCircle_Previews: PreviewProvider {
    static var previews: some View {
        UnreadCountCircle(count: 5)
    }
}
