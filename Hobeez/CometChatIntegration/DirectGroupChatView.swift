import Foundation
import SwiftUI

struct DirectGroupChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    let groupID = "cometchat-guid-1"

    var body: some View {
        Group {
            if let group = viewModel.group {
                MessagesView(group: group)
            } else {
                ProgressView("Loading Group...")
            }
        }
        .onAppear {
            viewModel.fetchGroup(guid: groupID)
        }
    }
}
