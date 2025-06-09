import SwiftUI

struct Login: View {
    @State var loginViewModel =  LoginViewModel()
   
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
            Text("Login")
                .font(.system(size: 30, weight: .bold))
                .padding()
            Text("Enter your email and password")
                .font(.system(size: 20))
                .foregroundStyle(Color(uiColor: UIColor.lightGray))
                .padding(.bottom, 20)
            AuthTextField(iconName: "envelope", typeOfTextField: "Email", placeholderOfTextField: "Enter your email", text: $loginViewModel.email)
            AuthTextField(iconName: "lock", typeOfTextField: "Password", placeholderOfTextField: "Enter your Password", text: $loginViewModel.password, isPassword: true, showPassword: $loginViewModel.showPassword)
                .padding(.top, 10)
                .padding(.bottom, 15)
            Button("Sign In", action: {
                loginViewModel.showSignUpPage = true
            })
            .buttonStyle(PrimaryButtonStyle())
            HStack {
                Text("Don't have an account?")
                Button {
                    loginViewModel.showSignUpPage = true
                } label: {
                    Text("Sign Up")
                       
                }
                .foregroundStyle(.primaryBg)
                
            }
            .padding(.top, 10)
            

            Spacer()
        }
        .fullScreenCover(isPresented: $loginViewModel.showSignUpPage, content: {
            SignUp()
        })
    }
}

#Preview {
    Login()
}
