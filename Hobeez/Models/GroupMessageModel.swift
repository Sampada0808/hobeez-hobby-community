import Foundation


struct GroupMessageModel: Identifiable {
    let id = UUID()
    var sender: UserModel
    var text: String?
    var imageName: String? 
    var timestamp: Date
    var type: GroupMessageType
    
    var time : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let currentTime = formatter.string(from: timestamp)

        return currentTime
    }
}
