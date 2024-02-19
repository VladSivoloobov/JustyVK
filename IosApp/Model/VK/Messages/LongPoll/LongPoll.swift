import Foundation

struct LongPoll: Decodable{
    var server: String;
    var key: String;
    var ts: Int;
}
