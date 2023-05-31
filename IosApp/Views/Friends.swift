//
//  Friends.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Friends: View {
    @State var searchableFriendsText: String = "";
    
    var body: some View {
        NavigationStack{
            List{
                
            }
            .searchable(
                text: $searchableFriendsText,
                prompt: "Поиск по друзьям"
            )
            .navigationTitle("Друзья")
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
