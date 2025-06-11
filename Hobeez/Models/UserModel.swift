import Foundation
import SwiftUI

struct UserModel: Identifiable, Hashable {
    let id = UUID()
    var userName: String
    var email: String
    var image: String?
    var bio: String?
    var hobbies: [Hobbies] 
}
