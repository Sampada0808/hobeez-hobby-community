import SwiftUI

enum FontWeight {
    case regular
    case medium
    case semiBold
    case bold
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .regular:
            Font.custom("EduNSWACTCursive-Regular", size: size)
        case .medium:
            Font.custom("EduNSWACTCursive-Regular_Medium", size: size)
        case .semiBold:
            Font.custom("EduNSWACTCursive-Regular_SemiBold", size: size)
        case .bold:
            Font.custom("EduNSWACTCursive-Regular_Bold", size: size)
        }
    }
}

extension Text {
    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
    }
}
