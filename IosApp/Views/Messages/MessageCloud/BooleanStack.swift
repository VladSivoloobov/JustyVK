import Foundation
import SwiftUI

struct BooleanStack<Content: View>: View{
    @ObservedObject var messageModel: MessageModel;
    let bool: Bool;
    var horizontalAlign: HorizontalAlignment = .center;
    var verticalAlign: VerticalAlignment = .center;
    var spacing: CGFloat? = 0;
    let content: () -> Content;
    
    var body: some View{
        if(bool){
            VStack(alignment: horizontalAlign, spacing: spacing, content: content)
        }
        else{
            HStack(alignment: verticalAlign, spacing: spacing, content: content)
        }
    }
}
