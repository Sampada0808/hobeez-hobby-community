import SwiftUI

struct ProfilePageView: View {
    @State private var selectedTab: Tab = .challenges
    let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(alignment: .top, spacing: 16) {
                CircularImage(imageName: "ArtistPerson", imageSize: 80)
                VStack(alignment: .leading, spacing: 8) {
                    Text("HoneyBee_123")
                        .font(.headline)
                    Text("Spreading creative pollen 🐝 Lover of art, crafts & stories.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                Spacer()
            }

            HStack(spacing: 32) {
                Spacer()
                ProfileStats(count: 12, label: "Hive")
                ProfileStats(count: 340, label: "Trail")
                ProfileStats(count: 56, label: "Honey\nDrops")
                ProfileStats(count: 4, label: "Buzz\nCount")
                Spacer()
            }
            .padding(.top, 8)
            
            Divider()
                .background(Color.gray.opacity(0.4))
            
            ZStack(alignment: .bottom) {
                // Background underline
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 1)

                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        VStack {
                            Text(tab.rawValue)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedTab == tab ? .black : .gray)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedTab = tab
                                    }
                                }

                            Rectangle()
                                .fill(selectedTab == tab ? Color.black : Color.clear)
                                .frame(height: 2)
                                .animation(.easeInOut, value: selectedTab)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }

            if selectedTab == .posts {
                ScrollView {
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
            }
            else if selectedTab == .challenges {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<20, id: \.self) { _ in
                            HStack(alignment: .top, spacing: 12) {
                                // Challenge image
                                Image("artBanner")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(12)

                                // Challenge details
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("🌟 Creative Challenge")
                                        .font(.headline)
                                        .lineLimit(1)

                                    Text("by HoneyBee_123")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    Text("Unleash your creativity and submit your best artwork by next Sunday!")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)

                                    HStack(spacing: 8) {
                                        Label("124", systemImage: "person.2.fill")
                                            .font(.caption)
                                            .foregroundColor(.gray)

                                        Label("3d left", systemImage: "clock.fill")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.top, 4)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(16)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }

                
            
            Spacer()
        }
        .padding()

    }
}




#Preview {
    ProfilePageView()
}
