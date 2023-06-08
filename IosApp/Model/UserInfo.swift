//
//  UserInfo.swift
//  Весточка
//
//  Created by Vladislav on 08.06.2023.
//

import Foundation

class UserInfo : ObservableObject{
    @Published var token: String = UserDefaults.standard.string(forKey: "accessToken") ?? "";
}
