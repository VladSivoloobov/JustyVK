import SwiftUI
import Foundation

extension View{
    func optional(_ neededOffset: Bool, apply: (AnyView) -> AnyView) -> AnyView{
        if(neededOffset){
            return apply(AnyView(self));
        }
        else{
            return AnyView(self);
        }
    }
}
