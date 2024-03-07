import Foundation

class UserProfileViewModel : ObservableObject{
    init(user: User) {
        self.userId = user.id
        self.name = user.firstName + " " + user.lastName
        self.id = String(user.id)
        self.lastOnline = String(user.lastSeen?.time ?? 0)
        self.status = user.status ?? ""
        self.user = user
        self.isOnline = user.online == 1
        self.lastSeenTime = user.lastSeen?.time ?? 0
        self.sex = user.sex ?? 0;
        
        self.createLastSeenString()
    }
    
    var userId: Int;
    @Published var name: String;
    @Published var avatar: String = "";
    @Published var id: String;
    @Published var lastOnline: String;
    @Published var scale: CGFloat = 120;
    @Published var avatarCornerRadius: CGFloat = 200;
    @Published var avatarOffset: CGFloat = 70;
    @Published var status: String;
    @Published var user: User;
    @Published var isOnline: Bool;
    @Published var lastSeenTime: Int;
    @Published var lastSeenString: String = "";
    @Published var sex: Int;
    
    func fetchAvatar(){
        SwiftVKSingletone.shared.photos.get(ownerId: id, albumId: "profile", rev: 1){ photos in
            if(!photos.isEmpty){
                self.avatar = photos[0].sizes.last!.url;
            }
            else{
                self.avatar = "https://vk.com/images/camera_400.png";
            }
        }
    }
    
    func createLastSeenString(){
        self.lastSeenString = SwiftVK.createLastSeenString(lastSeenTime: self.lastSeenTime, isOnline: self.isOnline, sex: self.sex);
    }
}
