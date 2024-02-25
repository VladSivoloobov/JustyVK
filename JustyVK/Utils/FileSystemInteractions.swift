import Foundation

struct FileSystemInteractions {
    static func getDocumentDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first;
    }
}
