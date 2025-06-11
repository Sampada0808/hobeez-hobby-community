import Foundation
import SwiftUI

struct RoundedButtonStyle : ButtonStyle {
    var bgColor : Color = .black
    var textColor : Color  = .white
    var opacity : Double? = 1
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(bgColor.opacity(opacity ?? 1))
            .foregroundStyle(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
