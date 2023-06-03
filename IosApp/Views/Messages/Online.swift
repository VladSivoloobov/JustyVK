//
//  Online.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Online: View {
    @State var isOnline = false;
    var body: some View {
        Circle()
            .frame(width: 10)
            .foregroundColor(isOnline ? .green : .clear)
    }
}

struct Online_Previews: PreviewProvider {
    static var previews: some View {
        Online()
    }
}
