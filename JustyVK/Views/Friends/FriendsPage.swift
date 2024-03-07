import SwiftUI

struct FriendsPage: View {
    @State var searchableFriendsText: String = "";
    @EnvironmentObject var userInfo: UserInfo;
    @StateObject var friendViewModel: FriendViewModel
    
    var body: some View {
        NavigationStack{
            List{
                Section(){
                    ForEach(friendViewModel.friendList, id: \.self.id){friend in
                        FriendRow(userProfileViewModel: UserProfileViewModel(
                            user: friend
                        ))
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .environment(\.defaultMinListRowHeight, 50)
            .listStyle(.plain)
            .searchable(
                text: $searchableFriendsText,
                prompt: "Поиск по друзьям"
                // TODO: Добавить возможность поиска друзей
            )
            .friendsPageToolbar(friendViewModel: friendViewModel)
        }
    }
}
