import SwiftUI

@main
struct HobeezApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                if hasCompletedOnboarding{
                    LoginView()
                        .transition(.move(edge: .trailing))
                        
                }else{
                    OnBoardingView()
                        .transition(.move(edge: .leading))
                }
            }
            .animation(.easeInOut(duration: 0.5), value: hasCompletedOnboarding)
            
            
        }
    }
    
}
