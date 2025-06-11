import Foundation
import SwiftUI

struct ProfileStats : View {
    var count : Int
    var label : String
    var body: some View {
        VStack(spacing: 4) {
            Text("\(count)")
                .font(.headline)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}
