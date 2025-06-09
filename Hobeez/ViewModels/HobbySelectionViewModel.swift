import Foundation
import SwiftUI

@Observable
class HobbySelectionViewModel {
    let hobbyData = Hobbies.allCases.map {$0.hobby}
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: 400)),
        GridItem(.adaptive(minimum: 400)),
        GridItem(.adaptive(minimum: 400)),
    ]
    var selectedHobbies : Set<UUID> = []
    var showProfilepage : Bool = false
    
    
}
