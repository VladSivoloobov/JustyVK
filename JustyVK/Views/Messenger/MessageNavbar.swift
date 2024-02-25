//
//  NavBar.swift
//  IosApp
//
//  Created by Vladislav on 02.06.2023.
//

import SwiftUI

struct MessageNavbar: View {
    @ObservedObject var dialogInfo: DialogViewModel;
    
    var body: some View {
        VStack{
            Text(dialogInfo.userName ?? "Неизвестно")
                .fontWeight(.medium)
                .lineLimit(1)
            
            if(dialogInfo.isOnlineString != nil){
                Text(dialogInfo.isOnlineString!)
                    .font(.subheadline)
                    .foregroundColor(dialogInfo.isOnline! ? .blue : .gray)
                    .padding(.bottom, 8)
                    .padding(.top, -10)
            }
        }
    }
}
