import SwiftUI

struct OnBoardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    var body: some View {
        VStack {
            Text("Hobbez")
                .customFont(.bold, 40)
                .padding(.top, 40)
                .foregroundStyle(.primaryBg)
            
            Text("Creativity is \n contagious — pass it on.")
                .foregroundStyle(Color(uiColor: .lightGray))
                .lineLimit(2)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            
            VStack {
                FlowHStackGrid(data: row1, speed: 25)
                FlowHStackGrid(data: row2)
                FlowHStackGrid(data: row3, speed: 20)
            }
            .frame(height: 300)
            Spacer()
            Button {
                hasCompletedOnboarding = true
            } label: {
                Text("Get Started")
            }
            .padding()
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}


#Preview {
    OnBoardingView()
}
