import Foundation

struct Response<T>: Decodable where T: Decodable{
    var response: T;
    
    enum CodingKeys: String, CodingKey{
        case response = "response";
    }
}
