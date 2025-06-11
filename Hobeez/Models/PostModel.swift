import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    static func == (lhs: PostModel, rhs: PostModel) -> Bool {
        lhs.id == rhs.id
    }

    let id = UUID()
    var caption: String
    var postImageName: String
    var likes: Int
    var comments: [CommentModel]
    var createdBy: UserModel
    var timestamp: Date
}



let dummyUsers: [UserModel] = [
    UserModel(
        userName: "BeeLover_22",
        email: "bee22@example.com",
        image: "profile1",
        bio: "Buzzing through life with crafts and honey!",
        hobbies: [.photography, .baking]
    ),
    UserModel(
        userName: "ArtHiveQueen",
        email: "queenbee@example.com",
        image: "profile2",
        bio: "Queen of doodles and honeycombs.",
        hobbies: [.animation, .art]
    )
]

let dummyPosts: [PostModel] = [
    PostModel(
        caption: "Finished my honeycomb sketch! 🍯✨",
        postImageName: "artBanner",
        likes: 128,
        comments: [
            CommentModel(user: "ArtHiveQueen", comment: "This is beautiful!", timestamp: Date()),
            CommentModel(user: "BeeLover_22", comment: "Incredible work!", timestamp: Date())
        ],
        createdBy: dummyUsers[0],
        timestamp: Date().addingTimeInterval(-3600)
    ),
    PostModel(
        caption: "Sunday paint session complete 🖌🐝",
        postImageName: "artBanner",
        likes: 95,
        comments: [
            CommentModel(user: "BeeLover_22", comment: "Love the color palette!", timestamp: Date())
        ],
        createdBy: dummyUsers[1],
        timestamp: Date().addingTimeInterval(-86400)
    ),
    PostModel(
        caption: "Bee-inspired mandala done 🌼✨",
        postImageName: "artBanner",
        likes: 212,
        comments: [],
        createdBy: dummyUsers[0],
        timestamp: Date().addingTimeInterval(-5400) 
    )
]
