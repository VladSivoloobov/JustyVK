import Foundation
import SwiftUI

struct GetMessageList: ViewModifier {
    var scrollReader: ScrollViewProxy;
    @ObservedObject var messenger: MessengerViewModel;
    var companionId: Int;
    @EnvironmentObject var userInfo: UserInfo;
    
    func body(content: Content) -> some View {
        content
            .onAppear{
                
        }
    }
}

extension View{
    func getMessageList(scrollReader: ScrollViewProxy,
                        messengerViewModel: MessengerViewModel,
                        companionId: Int) -> some View{
        modifier(GetMessageList(scrollReader: scrollReader,
                                messenger: messengerViewModel,
                                companionId: companionId));
    }
}
