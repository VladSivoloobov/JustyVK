import Foundation

struct LongPollEventListener{
    var event: LongPollUpdates;
    var callback: (LongPollEvent) -> ()
}
