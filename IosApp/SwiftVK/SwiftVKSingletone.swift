import Foundation

class SwiftVKSingletone{
    private static var token: String? = UserDefaults.standard.string(forKey: "accessToken");
    public static let shared = SwiftVK(token: token!);
    
    class func setToken(token: String){
        SwiftVKSingletone.token = token;
    }
    
    private init(){
        guard SwiftVKSingletone.token != nil else{
            fatalError("token in singletone is not set")
        }
    }
}
