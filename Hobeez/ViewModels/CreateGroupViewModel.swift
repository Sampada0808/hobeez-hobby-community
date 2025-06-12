import Foundation
import SwiftUI

@Observable
class CreateGroupViewModel {
    var showImageOptions : Bool = false
    var showCamera : Bool = false
    var showLibrary : Bool = false
    var groupImage : Image = Image(systemName: "photo.on.rectangle.angled")
    var groupName : String = ""
    var groupDescription : String = ""
    var selectedCategory : Hobbies = .art
    var isPrivate : Bool = false

}
