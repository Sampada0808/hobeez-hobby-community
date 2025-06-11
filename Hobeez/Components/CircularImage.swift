import Foundation
import SwiftUI

struct CircularImage : View {
    var imageName : String
    var imageSize : CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.yellow.opacity(0.6), lineWidth: 3)
            )
    }
}
