import Alamofire
import Foundation

public class SwiftVK {
    public let token: String;
    public let friends: SwiftVKFriends;
    public let users: SwiftVKUsers;
    public let messages: SwiftVKMessages;
    public let photos: SwiftVKPhotos;
    public let groups: SwiftVKGroups;
    
    public init(token: String) {
        self.token = token
        self.friends = SwiftVKFriends(token: token)
        self.users = SwiftVKUsers(token: token)
        self.messages = SwiftVKMessages(token: token)
        self.photos = SwiftVKPhotos(token: token)
        self.groups = SwiftVKGroups(token: token);
    }
    
    public static func createAttachmentMatrix<T>(arr: [T], byNumber: Int) -> [[T]]{
        var array: [[T]] = [];
        
        for i in stride(from: 0, to: arr.count, by: byNumber + 1){
            if(i + byNumber >= arr.count - 1){
                array.append(Array(arr[i...arr.count - 1]));
                break;
            }
            array.append(Array(arr[i...i + byNumber]));
        }
        
        return array;
    }
    
    public static func createLastSeenString(lastSeenTime: Int?, isOnline: Bool, sex: Int?) -> String{
        if(lastSeenTime == nil || sex == nil){
            return "Неизвестно";
        }
        var lastSeenString = "";
        if(isOnline){
            lastSeenString = "в сети";
            return lastSeenString;
        }
        
        switch(sex){
        case 1:
            lastSeenString = "была "
            break;
        case 2:
            lastSeenString = "был "
            break;
        default:
            lastSeenString = "был(а) "
            break;
        }
        
        if(lastSeenTime == -404){
            lastSeenString += "недавно";
            return lastSeenString;
        }
        
        let calendar = Calendar(identifier: .gregorian);
        let date = Date(timeIntervalSince1970: TimeInterval(lastSeenTime!));
        let daysDifference = calendar.numberOfDaysBetween(date);
        lastSeenString += calendar.getLastOnlineDateString(difference: daysDifference, date: date);
        return lastSeenString;
    }
    
    public static func createExtendedString(extendedItems: [ExtendedFields]) -> String{
        let extendedString = extendedItems.map{
            $0.rawValue;
        }
        .joined(separator: ", ");
        
        return extendedString;
    }
}
