import Foundation

struct CometChatSecrets {
    static var appID: String {
        return getValue(forKey: "COMETCHAT_APP_ID")
    }

    static var region: String {
        return getValue(forKey: "COMETCHAT_REGION")
    }

    static var authKey: String {
        return getValue(forKey: "COMETCHAT_AUTH_KEY")
    }

    private static func getValue(forKey key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Secret", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let value = dict[key] as? String else {
            fatalError("❌ Missing \(key) in Secrets.plist")
        }
        return value
    }
}
