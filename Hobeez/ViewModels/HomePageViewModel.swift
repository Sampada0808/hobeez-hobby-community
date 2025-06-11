import Foundation
import SwiftUI

@Observable
class HomePageViewModel {
    var showChallengeDetailView = false
    var showProfileView = false
    var showAllPosts = false
    var showCreatePost = false
    var selectedContentType : ContentTypes = .forYou
}
