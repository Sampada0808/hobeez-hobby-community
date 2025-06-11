import Foundation
import SwiftUI

@Observable
class CreatePostViewModel {
    var  displayImage : Image? 
    var caption : String = ""
    var createdBy : UserModel?
    var showImageOptions : Bool = false
    var showCamera : Bool = false
    var showLibrary : Bool = false
}
