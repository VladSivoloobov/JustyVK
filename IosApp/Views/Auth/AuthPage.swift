//
//  Login.swift
//  IosApp
//
//  Created by Vladislav on 31.05.2023.
//

import SwiftUI
import SwiftyVK

struct AuthPage: View {
    func application(
        _ application: UIApplication,
        open url: URL,
        sourceApplication: String?,
        annotation: Any
    ) -> Bool {
        VK.handle(url: url, sourceApplication: sourceApplication)
        return true
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear{
                
            }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        AuthPage()
    }
}
