import Foundation
import SwiftUI

@Observable
class SignUpViewModel {
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var showPassword : Bool = false
}
