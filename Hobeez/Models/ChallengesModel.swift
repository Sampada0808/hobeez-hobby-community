import Foundation
import SwiftUI

struct ChallengeModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let participantsCount: Int
    let createdBy: String
    let participantUsernames: [String]
    let bannerImageName: String
    let description: String?
    let startDate: Date
    let hobby : Hobbies
}


let sampleChallenges: [ChallengeModel] = [
    ChallengeModel(
        name: "Sketch Your Pet",
        participantsCount: 112,
        createdBy: "MiaMassie",
        participantUsernames: ["artbyme", "sketchqueen", "doodlebro"],
        bannerImageName: "artBanner",
        description: "Draw or paint a portrait of your pet in your unique style!",
        startDate: Date().addingTimeInterval(-3600 * 24 * 2),
        hobby: .art
    ),
    ChallengeModel(
        name: "Bake the Perfect Muffin",
        participantsCount: 67,
        createdBy: "BakeMasters",
        participantUsernames: ["yumcakes", "ovenaddict"],
        bannerImageName: "BakingChallengeBanner",
        description: "Try your hand at baking the fluffiest muffin. Share the recipe too!",
        startDate: Date().addingTimeInterval(-3600 * 48),
        hobby: .baking
    ),
    ChallengeModel(
        name: "Golden Hour Photography",
        participantsCount: 142,
        createdBy: "PhotoSnap",
        participantUsernames: ["snapster", "lightchaser", "sunlens"],
        bannerImageName: "PhotographyBanner",
        description: "Capture a beautiful photo during the golden hour.",
        startDate: Date().addingTimeInterval(-3600 * 3),
        hobby: .photography
    ),
    ChallengeModel(
        name: "Read & Reflect: 10 Pages a Day",
        participantsCount: 89,
        createdBy: "BookHive",
        participantUsernames: ["bookworm", "pagebyday", "readandgrow"],
        bannerImageName: "ReadingChallengeBanner",
        description: "Read 10 pages daily and write a short reflection.",
        startDate: Date().addingTimeInterval(-3600 * 72),
        hobby: .reading
    ),
    ChallengeModel(
        name: "Lo-Fi Chill Beat Loop",
        participantsCount: 55,
        createdBy: "SoundLab",
        participantUsernames: ["beatboy", "vinylwave"],
        bannerImageName: "MusicChallengeBanner",
        description: "Produce a 30-second lo-fi loop with chill vibes.",
        startDate: Date().addingTimeInterval(-3600 * 5),
        hobby: .music
    ),
    ChallengeModel(
        name: "Mini Game Jam: 2-Day Challenge",
        participantsCount: 98,
        createdBy: "GameCraft",
        participantUsernames: ["devgeek", "pixelcoder"],
        bannerImageName: "GameDevChallengeBanner",
        description: "Create a simple game prototype in 48 hours using any engine.",
        startDate: Date().addingTimeInterval(-3600 * 48),
        hobby: .gameDev
    ),
    ChallengeModel(
        name: "Plant Care Routine",
        participantsCount: 74,
        createdBy: "GreenThumbs",
        participantUsernames: ["plantmom", "soilbro", "leaflover"],
        bannerImageName: "GardeningChallengeBanner",
        description: "Share your weekly plant care checklist with others.",
        startDate: Date().addingTimeInterval(-3600 * 168),
        hobby: .gardening
    ),
    ChallengeModel(
        name: "Animate a Simple Loop",
        participantsCount: 63,
        createdBy: "FrameByFrame",
        participantUsernames: ["loopcreator", "motionaddict"],
        bannerImageName: "AnimationChallengeBanner",
        description: "Make a 3-second animation loop using any tool (hand-drawn, After Effects, etc.)",
        startDate: Date().addingTimeInterval(-3600 * 30),
        hobby: .animation
    ),
    ChallengeModel(
        name: "30-Second Dance Reel",
        participantsCount: 120,
        createdBy: "DanceSphere",
        participantUsernames: ["twirltok", "moveit"],
        bannerImageName: "DanceChallengeBanner",
        description: "Create a short dance reel to your favorite trending song.",
        startDate: Date().addingTimeInterval(-3600 * 10), 
        hobby: .dance
    )
]
