import SwiftUI
import CometChatSDK

struct ChatView: View {
    @Binding var message : String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        DirectGroupChatView()

    }
}

#Preview {
    ChatView(message: .constant(""))
}
