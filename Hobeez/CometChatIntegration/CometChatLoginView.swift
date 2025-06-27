import SwiftUI
import CometChatSDK
import CometChatUIKitSwift

struct CometChatLoginView: View {
    let users = ["cometchat-uid-2", "cometchat-uid-3",
                 "cometchat-uid-4"]
        @State private var selectedUser = "user1"
        @State private var isLoggedIn = false

        var body: some View {
            VStack {
                Picker("Select User", selection: $selectedUser) {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                }.pickerStyle(.segmented)
                
                Button("Login as \(selectedUser)") {
                    CometChatUIKit.login(uid: selectedUser) { result in
                        switch result {
                        case .success:
                            isLoggedIn = true
                        case .onError(let error):
                            print("Login failed: \(error.errorDescription)")
                        @unknown default:
                            break
                        }
                    }
                }

                if isLoggedIn {
                    DirectGroupChatView() // your main chat view
                }
            }
            .padding()
        }
}

#Preview {
    CometChatLoginView()
}
