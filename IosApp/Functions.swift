import Alamofire
import SwiftUI

func filterParams(params: Parameters) -> Parameters{
    return params.filter{ param -> Bool in
        return String(describing: param.value) != "";
    }
}

let defaultImage = "https://kartinki.pics/uploads/posts/2022-12/1670449450_5-kartinkin-net-p-kharder-sobaka-vkontakte-5.png";
