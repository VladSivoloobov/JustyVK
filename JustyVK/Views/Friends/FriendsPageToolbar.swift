import SwiftUI

struct FriendsPageToolbar: ViewModifier{
    @ObservedObject var friendViewModel: FriendViewModel;
    
    func body(content: Content) -> some View{
        content
            .navigationTitle("Друзья")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Menu(){
                        Section("Сортировка"){
                            Button("Сначала онлайн"){
                                withAnimation{
                                    friendViewModel.filterFriendsByOnline(friendList: nil);
                                }
                            }
                            Button("По алфавиту"){
                                withAnimation{
                                    friendViewModel.filterFriendsByAlphabet()
                                }
                            }
                        }
                    } label: {
                        Label("Сортировка", systemImage: "arrow.up.arrow.down")
                            .foregroundColor(.blue)
                }
            }
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
}

extension View{
    func friendsPageToolbar(friendViewModel: FriendViewModel) -> some View{
        modifier(FriendsPageToolbar(friendViewModel: friendViewModel));
    }
}
