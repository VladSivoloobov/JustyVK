import Foundation
import Alamofire

struct WebInteractions{
    static func filterParams(params: Parameters) -> Parameters{
        return params.filter{ param -> Bool in
            return String(describing: param.value) != "";
        }
    }
    
    static func fetchData<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters, completion: @escaping (T?) -> Void) {
        AF.request(url, method: method, parameters: parameters).response { response in
            do {
                if let data = response.data {
                    
                    debugJsonOutput(data: data)
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                }
            } catch {
                print(url);
                print("error");
                print(error)
                print("\n")
                completion(nil)
            }
        }
    }
    
    private static func debugJsonOutput(data: Data){
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            print(String(decoding: jsonData, as: UTF8.self))
        }
    }
    
    static func downloadFile(url: String, path: String, fileName: String, completion: @escaping (URL?) -> Void){
        AF.request(url, method: .get).response { response in
            do {
                if let data = response.data {
                    let fileExtension = URL(string: url)!.pathExtension;
                    
                    do{
                        let filename = FileSystemInteractions.getDocumentDirectory()!.appendingPathComponent(path);
                        
                        print(filename)
                        
                        try FileManager.default.createDirectory(atPath: filename.path, withIntermediateDirectories: true, attributes: nil)
                        
                        try data.write(to: filename.appendingPathComponent("\(fileName).\(fileExtension)"), options: .atomic);
                        
                        completion(filename);
                        
                    } catch let error{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
