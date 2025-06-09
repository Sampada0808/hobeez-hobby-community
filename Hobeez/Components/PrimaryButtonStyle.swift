import Foundation
import SwiftUI

struct PrimaryButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 24))
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .background(.primaryBg)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .primaryBg.opacity(0.8),radius: 5, x: 5, y: 5)
    }
}
