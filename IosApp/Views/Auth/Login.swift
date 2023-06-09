//
//  Login.swift
//  Весточка
//
//  Created by Vladislav on 08.06.2023.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VKAuthWebView()
            .ignoresSafeArea(.all)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
