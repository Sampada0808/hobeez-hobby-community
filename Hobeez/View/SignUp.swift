import SwiftUI

struct SignUp: View {
    @State var signUpViewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.primaryBg.opacity(0.4))
                .frame(width: 90, height: 90)
                .overlay {
                    Image("SplashScreen1")
                        .resizable()
                        .frame(width: 70, height: 60)
                }
                .padding(.vertical, 30)
            Text("Sign Up")
                .font(.system(size: 30, weight: .bold))
                .padding()
            Text("Enter your credentials and continue")
                .font(.system(size: 20))
                .foregroundStyle(Color(uiColor: UIColor.lightGray))
                .padding(.bottom, 20)
            AuthTextField(iconName: "person", typeOfTextField: "UserName", placeholderOfTextField: "Enter your username", text: $signUpViewModel.userName)
            AuthTextField(iconName: "envelope", typeOfTextField: "Email", placeholderOfTextField: "Enter your email", text: $signUpViewModel.email)
                .padding(10)
            AuthTextField(iconName: "lock", typeOfTextField: "Password", placeholderOfTextField: "Enter your password", text: $signUpViewModel.password, isPassword: true, showPassword: $signUpViewModel.showPassword)
                .padding(.bottom, 15)
            Button("Sign Up") {
                
            }
            .buttonStyle(PrimaryButtonStyle())
            HStack {
                Text("Already have an account?")
                Button {
                    dismiss()
                } label: {
                    Text("Sign In")
                       
                }
                .foregroundStyle(.primaryBg)
            }
            .padding(.top, 10)
            Spacer()
        }
        
        
    }
}

#Preview {
    SignUp()
}
