import Foundation
import SwiftUI

@Observable
class LoginViewModel {
    var email : String = ""
    var password : String = ""
    var showPassword : Bool = false
    var showSignUpPage : Bool = false
    
}
