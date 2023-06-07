//
//  UIApplicationExtensions.swift
//  Весточка
//
//  Created by Vladislav on 07.06.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
