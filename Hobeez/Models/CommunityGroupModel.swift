import Foundation
import SwiftUI

struct CommunityGroupModel {
    var groupName: String
    var groupImage: String
    var members: [UserModel]
    var messages: [GroupMessageModel]
}





let dummyMessages: [GroupMessageModel] = [
    GroupMessageModel(
        sender: dummyUsers[0],
        text: "Hey everyone! Ready for the weekend challenge?",
        imageName: nil,
        timestamp: Date().addingTimeInterval(-3600),
        type: .text
    ),
    GroupMessageModel(
        sender: dummyUsers[1],
        text: nil,
        imageName: "artBanner",
        timestamp: Date().addingTimeInterval(-3000),
        type: .image
    ),

    GroupMessageModel(
        sender: dummyUsers[0],
        text: "Wow, Charlie! That’s beautiful.",
        imageName: nil,
        timestamp: Date().addingTimeInterval(-600),
        type: .text
    )
]


let dummyCommunityGroup = CommunityGroupModel(
    groupName: "Sketch Weekly",
    groupImage: "artBanner",
    members: dummyUsers,
    messages: dummyMessages
)
