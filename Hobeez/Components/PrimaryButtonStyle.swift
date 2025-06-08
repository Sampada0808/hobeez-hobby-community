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
    }
}
