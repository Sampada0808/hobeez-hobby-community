import Foundation
import SwiftUI

@Observable
class ProfileCustomisationViewModel{
    var name : String = ""
    var Bio : String = ""
    var avatar : Image = Image("person")
    var showImageOptions =  false
    var showLibrary = false
    var showCamera = false
}
