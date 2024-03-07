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
                    print(String(data: data, encoding: .utf8));
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                }
            } catch {
                print(error)
                completion(nil)
            }
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
