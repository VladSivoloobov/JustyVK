import Foundation
import SwiftUI

struct FriendRowOverlay: ViewModifier{
    @ObservedObject var userProfileViewModel: UserProfileViewModel;
    @EnvironmentObject var globalUIStates: GlobalUIStates;
    func body(content: Content) -> some View{
        content.overlay{
            NavigationLink(
                destination: {
                    UserProfile(
                        userProfileViewModel: userProfileViewModel
                    )
                        .onAppear(){
                            globalUIStates.tabBarVisible.toggle();
                        }
                        .onDisappear(){
                            withAnimation(.spring()){
                                globalUIStates.tabBarVisible.toggle();
                            }
                        }
                }, label: {
                    EmptyView()
                }
            )
            .opacity(0)
        }
    }
}

extension View{
    func friendRowOverlay(userProfileViewModel: UserProfileViewModel) -> some View{
        modifier(FriendRowOverlay(userProfileViewModel: userProfileViewModel));
    }
}
