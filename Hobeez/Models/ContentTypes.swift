import Foundation

enum ContentTypes{
    case forYou, mostPopular
    
    var title : String {
        switch self {
        case .forYou:
            "For You"
        case .mostPopular:
            "Most Popular"
        }
    }
}
