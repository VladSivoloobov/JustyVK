//
//  Settings.swift
//  IosApp
//
//  Created by Vladislav on 30.05.2023.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var userInfo: UserInfo;
    
    var body: some View {
        NavigationStack{
            List{
                Button(action: {
                    () -> Void in
                    userInfo.token = "";
                }){
                    Label("Выйти", systemImage: "door.left.hand.open")
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
