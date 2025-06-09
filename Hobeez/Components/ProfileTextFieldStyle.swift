import Foundation
import SwiftUI

struct ProfileTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.system(size: 20, weight: .bold))
            .padding()
            .background(.indigo.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
