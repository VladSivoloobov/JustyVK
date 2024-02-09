import Alamofire
import SwiftUI

func fetchData<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters, completion: @escaping (T?) -> Void) {
    AF.request(url, method: method, parameters: parameters).response { response in
        do {
            if let data = response.data {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            }
        } catch {
            print(error)
            completion(nil)
        }
    }
}

func filterParams(params: Parameters) -> Parameters{
    return params.filter{ param -> Bool in
        return String(describing: param.value) != "";
    }
}

let defaultImage = "https://kartinki.pics/uploads/posts/2022-12/1670449450_5-kartinkin-net-p-kharder-sobaka-vkontakte-5.png";
