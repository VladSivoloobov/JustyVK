//
//  NavBar.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI

struct MessageNavbar: View {
    @State private var bottomSheetOpened = false;
    var isOnline: Bool;
    var name: String;
    var onlineStatusString: String?;
    
    // TODO: Изменить на перечисление
    
    var body: some View {
        VStack{
            Text(name)
                .fontWeight(.medium)
                .lineLimit(1)
            
            if(onlineStatusString != nil){
                Text(onlineStatusString!)
                    .font(.subheadline)
                    .foregroundColor(isOnline ? .blue : .gray)
                    .padding(.bottom, 8)
                    .padding(.top, -10)
            }
        }
        .onTapGesture {
            bottomSheetOpened = true;
        }
        .sheet(isPresented: $bottomSheetOpened) {
            Text("Открыто")
        }

    }
}
