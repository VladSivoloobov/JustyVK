import Foundation

class FriendViewModel : ObservableObject {
    init(){
        getFriendsList();
    }
    
    func getFriendsList(){
        if(self.friendList.count > 0){
            return;
        }
        SwiftVKSingletone.shared.friends.get(
            fields: [
                "status",
                "photo_100",
                "screen_name",
                "last_seen",
                "sex",
                "online"
            ]
        ){ friends in
            self.filterFriendsByOnline(friendList: friends);
        }
    }
    
    func filterFriendsByOnline(friendList: [User]?){
        let friends = friendList ?? self.friendList;
        let onlineFriends = friends.filter{ friend in
            return friend.online == 1
        }
        
        let offlineFriends = friends.filter{ friend in
            return friend.online != 1;
        }
        
        self.friendList = onlineFriends + offlineFriends;
    }
    
    func filterFriendsByAlphabet(){
        self.friendList = friendList.sorted{$0.firstName < $1.firstName};
    }

    @Published var friendList = [User]()
}
