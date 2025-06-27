import SwiftUI
import CometChatSDK

struct MessagesView: UIViewControllerRepresentable {
    let group: CometChatSDK.Group

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = MessagesVC()
        vc.group = group
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

