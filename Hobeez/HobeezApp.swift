import SwiftUI

@main
struct HobeezApp: App {
    @State var tabManager = TabManager()
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ZStack {
                if hasCompletedOnboarding {
                    if isUserLoggedIn {
                        TabView(selection: $tabManager.selectedTab) {
                            HomePage()
                                .environment(tabManager)
                                .tabItem {
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                }
                                .tag(1)
                            CommunityPageView()
                                .environment(tabManager)
                                .tabItem {
                                    Image(systemName: "rectangle.3.group.bubble.fill")
                                    Text("Community")
                                }
                                .tag(2)
                            ChallengeView()
                                .environment(tabManager)
                                .tabItem {
                                    Image(systemName: "trophy.fill")
                                    Text("Challenge")
                                }
                                .tag(3)
                            ProfilePageView()
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("Profile")
                                }
                                .tag(4)
                        }
                        .environment(tabManager)
                        .transition(.move(edge: .trailing))
                    } else {
                        LoginView()
                            .transition(.move(edge: .trailing))
                    }
                } else {
                    OnBoardingView()
                        .transition(.move(edge: .leading))
                }
            }
            .animation(.easeInOut(duration: 0.5), value: isUserLoggedIn)
        }
    }
}

