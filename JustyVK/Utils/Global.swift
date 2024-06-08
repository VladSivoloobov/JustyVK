import Foundation

let defaultImage = "https://kartinki.pics/uploads/posts/2022-12/1670449450_5-kartinkin-net-p-kharder-sobaka-vkontakte-5.png";

func parseTime(time: Int) -> String{
    let date = Date(timeIntervalSince1970: TimeInterval(time));
    let calendar = Calendar.current;
    
    let hours = calendar.component(.hour, from: date);
    let seconds = calendar.component(.second, from: date);
    
    func addZeroToSmallTimeValue(integer: Int) -> String{
        if(integer < 10){
            return "0" + String(integer);
        }
        
        return String(integer);
    }
    
    return "\(addZeroToSmallTimeValue(integer: hours)):\(addZeroToSmallTimeValue(integer: seconds))"
}
