import Foundation
import UIKit
import CometChatUIKitSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    let uid = "cometchat-uid-1"

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        let uikitSettings = UIKitSettings()
            .set(appID: CometChatSecrets.appID)
            .set(region: CometChatSecrets.region)
            .set(authKey: CometChatSecrets.authKey)
            .subscribePresenceForAllUsers()
            .build()

        CometChatUIKit.init(uiKitSettings: uikitSettings) { result in
            switch result {
            case .success:
                print("✅ CometChat UI Kit initialization succeeded")

                CometChatUIKit.login(uid: self.uid) { loginResult in
                    switch loginResult {
                    case .success:
                        print("✅ CometChat UI Kit login succeeded")
                    case .onError(let error):
                        print("❌ Login failed: \(error.description)")
                    @unknown default:
                        break
                    }
                }

            case .failure(let error):
                print("❌ Initialization failed: \(error.localizedDescription)")
            }
        }

        return true
    }
}

