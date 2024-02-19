import Foundation
import Alamofire

extension SwiftVK{
    public struct SwiftVKPhotos{
        public let token: String;
        let url = "https://api.vk.com/method/photos.get";
        
        func get(ownerId: String,
                 albumId: String,
                 photoIds: String = "",
                 rev: Int = 0,
                 offset: String = "",
                 count: Int = 100,
                 completion: @escaping ([Photo]) -> ()){
            let params: Parameters = [
                "access_token": token,
                "owner_id": ownerId,
                "count": count,
                "rev": rev,
                "offset": offset,
                "album_id": albumId,
                "photo_ids": photoIds,
                "v": "5.131",
            ];
            
            WebInteractions.fetchData(url: url, method: .post, parameters: params) {
                (photos: Response<Photos>?) in
                if let fetchedPhotos = photos{
                    completion(fetchedPhotos.response.items)
                }
            }
        }
    }

}
