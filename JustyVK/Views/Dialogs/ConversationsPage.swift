import SwiftUI

struct ConversationsPage: View {
    @State var searchString = "";
    @State var viewWidth = CGFloat.zero;
    @EnvironmentObject var userInfo: UserInfo;
    @Environment(\.editMode) private var editMode
    @StateObject var dialogList: DialogListViewModel;
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(dialogList.conversations, id: \.self.conversation.peer.id){ conversationInfo in
                        ConversationItem(
                            dialogInfo: DialogViewModel(conversationInfo)
                        )
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .dialogModifiers($searchString)
            .toolbar{
                EditButton()
            }
        }
    }
}
