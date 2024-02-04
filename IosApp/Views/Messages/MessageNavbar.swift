//
//  NavBar.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI

struct MessageNavbar: View {
    @State private var bottomSheetOpened = false;
    var name: String;
    
    var body: some View {
        VStack{
            Text(name)
                .fontWeight(.medium)
                .padding(.bottom, -8)
            Text("онлайн")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .onTapGesture {
            bottomSheetOpened = true;
        }
        .sheet(isPresented: $bottomSheetOpened) {
            Text("Открыто")
        }

    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        MessageNavbar(name: "Арина Мануйлова")
    }
}
