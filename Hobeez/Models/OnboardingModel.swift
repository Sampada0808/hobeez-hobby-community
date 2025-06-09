import Foundation
import SwiftUI

struct OnboardingModel : Identifiable, Hashable {
    let id  = UUID()
    let image : String
    let hobbyName : String
    
}


var row1 : [OnboardingModel] = [
    OnboardingModel(image: "Art", hobbyName: "Art"),
    OnboardingModel(image: "Animation", hobbyName: "Animation"),
    OnboardingModel(image: "Baking", hobbyName: "Baking")
]

var row2 : [OnboardingModel] = [
    OnboardingModel(image: "Gardening", hobbyName: "Gardening"),
    OnboardingModel(image: "gameDev", hobbyName: "Game Development"),
    OnboardingModel(image: "Camera", hobbyName: "Photography"),
]

var row3 : [OnboardingModel] = [
    OnboardingModel(image: "knitting", hobbyName: "Knitting"),
    OnboardingModel(image: "music", hobbyName: "Music"),
    OnboardingModel(image: "reading", hobbyName: "Reading"),
]
