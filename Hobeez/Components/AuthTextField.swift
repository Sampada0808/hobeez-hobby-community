import SwiftUI

struct AuthTextField: View {
    let iconName: String
    let typeOfTextField: String
    let placeholderOfTextField: String
    @Binding var text: String
    var isPassword: Bool = false
    var showPassword: Binding<Bool>? = nil 
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .stroke(Color(uiColor: UIColor.lightGray))
            .frame(width: UIScreen.main.bounds.width - 40, height: 80)
            .overlay {
                HStack(spacing: 20) {
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)

                    Rectangle()
                        .fill(Color(uiColor: UIColor.lightGray).opacity(0.4))
                        .frame(width: 2, height: 80)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(typeOfTextField)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)

                        ZStack(alignment: .trailing) {
                            if isPassword, let showPassword = showPassword {
                                Group {
                                    if showPassword.wrappedValue {
                                        TextField(placeholderOfTextField, text: $text)
                                            .font(.system(size: 18, weight: .semibold))
                                    } else {
                                        SecureField(placeholderOfTextField, text: $text)
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                }

                                Button {
                                    showPassword.wrappedValue.toggle()
                                } label: {
                                    Image(systemName: showPassword.wrappedValue ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 10)
                            } else {
                                TextField(placeholderOfTextField, text: $text)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                        }
                    }
                }
            }
    }
}
