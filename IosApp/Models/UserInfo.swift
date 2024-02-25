import Foundation

class UserInfo : ObservableObject{
    // TODO: Переместить токен в keychain
    @Published var token: String = UserDefaults.standard.string(forKey: "accessToken") ?? "";
    @Published var firstName: String?;
    @Published var lastName: String?;
    @Published var id: Int?;
    @Published var isClosed: Bool?;
    @Published var canAccessClosed: Bool?;
}
