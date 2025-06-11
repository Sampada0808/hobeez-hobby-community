import Foundation


struct CommentModel : Hashable {
    let id = UUID()
    let user : String
    let comment : String
    let timestamp : Date
}
