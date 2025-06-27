import CometChatSDK
import Combine

class ChatViewModel: ObservableObject {
    @Published var group: Group?

    func fetchGroup(guid: String) {
        CometChat.getGroup(GUID: guid, onSuccess: { group in
            DispatchQueue.main.async {
                self.group = group
            }
        }, onError: { error in
            print("Failed to fetch group: \(error?.errorDescription ?? "technical error")")
        })
    }
}
