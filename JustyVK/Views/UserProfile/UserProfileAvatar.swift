import SDWebImageSwiftUI
import SwiftUI

struct UserProfileAvatar: View {
    @ObservedObject var userProfileViewModel: UserProfileViewModel;
    var body: some View {
        WebImage(url: URL(string: userProfileViewModel.avatar))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: userProfileViewModel.scale, height: userProfileViewModel.scale)
            .cornerRadius(userProfileViewModel.avatarCornerRadius)
            .padding(.bottom, 10)
            .onTapGesture {
                if userProfileViewModel.scale == 400{
                    withAnimation(
                        .interpolatingSpring(
                            mass: 1,
                            stiffness: 80,
                            damping: 15,
                            initialVelocity: 10)
                    ){
                        userProfileViewModel.scale = 120;
                        userProfileViewModel.avatarCornerRadius = 200;
                        userProfileViewModel.avatarOffset = 70;
                    }
                }
                else{
                    withAnimation(
                        .interpolatingSpring(
                            mass: 1,
                            stiffness: 80,
                            damping: 15,
                            initialVelocity: 20)
                    ){
                        userProfileViewModel.scale = 400
                        userProfileViewModel.avatarCornerRadius = 0;
                        userProfileViewModel.avatarOffset = 0;
                    }
                }
            }
    }
}
