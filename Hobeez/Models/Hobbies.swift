import Foundation
import SwiftUI

enum Hobbies: String, CaseIterable, Identifiable {
    var id: String { rawValue }

    case animation, art, baking, music, dance, gameDev, gardening, photography, reading
    
    var title : String {
        switch self {
        case .animation:
            return "Animation"
        case .art:
            return "Art"
        case .baking:
            return "Baking"
        case .music:
            return "Music"
        case .dance:
            return "Dance"
        case .gameDev:
            return "Game Dev"
        case .gardening:
            return "Gardening"
        case .photography:
            return "Photography"
        case .reading:
            return "Reading"
        }
    }
    
    var bgColor : Color {
        switch self {
        case .animation:
                .animation
        case .art:
                .art
        case .baking:
                .baking
        case .music:
                .music
        case .dance:
                .dance
        case .gameDev:
                .gameDev
        case .gardening:
                .gardening
        case .photography:
                .photography
        case .reading:
                .reading
        }
    }
    var image : Image {
        switch self{
        case .animation:
            Image("AnimationIcon")
        case .art:
            Image("ArtIcon")
        case .baking:
            Image("BakingIcon")
        case .music:
            Image("MusicIcon")
        case .dance:
            Image("DanceIcon")
        case .gameDev:
            Image("GameDevIcon")
        case .gardening:
            Image("GardenIcon")
        case .photography:
            Image("CameraIcon")
        case .reading:
            Image("ReadingIcon")
        }
    }
}

extension Hobbies {
    var hobby: HobbyModel {
           HobbyModel(
               name: self.title,
               image: self.image,
               bgColor: self.bgColor
           )
       }
}
