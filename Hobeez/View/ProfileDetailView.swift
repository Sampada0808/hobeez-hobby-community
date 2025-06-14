import SwiftUI

struct ProfileDetailView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Account")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                CircularImage(imageName: "ArtistPerson", imageSize: 120)
                Text(dummyUsers[0].userName)
                    .padding(5)
                    .font(.system(size: 25, weight: .bold))
                HStack(spacing: 32) {
                    Spacer()
                    ProfileStats(count: 12, label: "Hive")
                    ProfileStats(count: 340, label: "Trail")
                    ProfileStats(count: 56, label: "Honey\nDrops")
                    ProfileStats(count: 4, label: "Buzz\nCount")
                    Spacer()
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 8)
                .padding(.bottom)
                HStack{
                    Button {
                        
                    } label: {
                        Text("Follow")
                    }
                    .buttonStyle(RoundedButtonStyle(bgColor: .bgTints, textColor: .black , opacity: 0.3))
                    Button {
                        
                    } label: {
                        Text("Message")
                    }
                    .buttonStyle(RoundedButtonStyle(bgColor: .accent, textColor: .black , opacity: 0.3))

                }
            }
            .padding(.bottom)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .ignoresSafeArea()
            }
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0..<20, id: \.self) { _ in
                        Image("artBanner")
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width / 3 - 4, height: UIScreen.main.bounds.width / 3 - 4)
                            .clipped()
                    }
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    ProfileDetailView()
}
