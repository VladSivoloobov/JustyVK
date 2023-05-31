//
//  DialogPage.swift
//  IosApp
//
//  Created by Vladislav on 31.05.2023.
//

import SwiftUI

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}

struct DialogPage: View {
    var name: String;
    var image: String;
    
    
    var body: some View {
        ScrollView{
            
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Image(image)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(.infinity)
                    .padding(.trailing, 5)
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct DialogPage_Previews: PreviewProvider {
    static var previews: some View {
        DialogPage(name: "Анна Гростимова", image: "Avatar")
    }
}
