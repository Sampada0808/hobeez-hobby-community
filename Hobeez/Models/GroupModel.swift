import Foundation
import SwiftUI

struct GroupModel {
    let id = UUID()
    var groupName: String
    var groupImage: String
    var createdBy: UserModel
    var description: String?
    var category: Hobbies
    var members: [UserModel]
    var isPrivate: Bool
    var createdDate: Date
    var message : [GroupMessageModel]
}


let user1 = UserModel(
    userName: "Alice",
    email: "alice@example.com",
    image: "userAlice",
    bio: "Loves painting and digital art",
    hobbies: [.art, .photography]
)

let user2 = UserModel(
    userName: "Bob",
    email: "bob@example.com",
    image: "userBob",
    bio: "Nature enthusiast and traveler",
    hobbies: [.art, .animation]
)


let message1 = GroupMessageModel(
    sender: user1,
    text: "Hey everyone! Excited to be here 😊",
    imageName: nil,
    timestamp: Date(),
    type: .text
)

let message2 = GroupMessageModel(
    sender: user2,
    text: nil,
    imageName: "artBanner",
    timestamp: Date().addingTimeInterval(-3600),
    type: .image
)

let message3 = GroupMessageModel(
    sender: user1,
    text: "Love this photo, Bob!",
    imageName: nil,
    timestamp: Date().addingTimeInterval(-1800),
    type: .text
)

let artGroup = GroupModel(
    groupName: "Creative Collective",
    groupImage: "groupArtBanner",
    createdBy: user1,
    description: "A space for creatives to share and inspire",
    category: .art,
    members: [user1, user2],
    isPrivate: false,
    createdDate: Date().addingTimeInterval(-86400), // 1 day ago
    message: [message1, message2, message3]
)
