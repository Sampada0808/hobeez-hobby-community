import SwiftUI

struct FlowHStackGrid: View {
    var data: [OnboardingModel]
    var rowHeight: CGFloat = 100
    var speed: Double = 30
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                rowContent
                rowContent
            }
            .offset(x: offset)
            .onAppear {
                let fullWidth = estimateTotalContentWidth()
                animateScroll(contentWidth: fullWidth)
            }
        }
        .frame(height: rowHeight)
        .clipped()
    }

    var rowContent: some View {
        HStack(spacing: 20) {
            ForEach(data, id: \.self) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Text(item.hobbyName)
                        .font(.system(size: 20, weight: .medium))
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: rowHeight )
                        .fill(Color(uiColor: .lightGray).opacity(0.2))
                )
            }
        }
    }
    
    func animateScroll(contentWidth: CGFloat) {
        offset = 0
        let baseAnimation = Animation.linear(duration: speed).repeatForever(autoreverses: false)
        withAnimation(baseAnimation) {
            offset = -contentWidth
        }
    }
    

    func estimateTotalContentWidth() -> CGFloat {
        let averageItemWidth: CGFloat = 180 
        return averageItemWidth * CGFloat(data.count + 1)
    }
}
