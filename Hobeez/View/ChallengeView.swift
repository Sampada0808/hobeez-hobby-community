import SwiftUI

struct ChallengeView: View {
    @State var viewModel =  ChallengeDetailViewModel()
    var body: some View {
        VStack {
            HStack{
                Text("Current Challenges")
                    .font(.system(size: 25, weight: .bold))
                    .padding()
                Spacer()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Keep it up, Mia!")
                        .font(.headline)
                    Text("You've joined 4 challenges this month.")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
            }
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("🏆 Leaderboard")
                    .font(.title3.bold())
                    .padding(.horizontal)

                ForEach(0..<3) { i in
                    LeaderboardRow(rank: i+1, userName: "User\(i+1)", score: 100 - i * 10)
                        .padding(.horizontal)
                }
            }
            .padding(.top)


            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<20, id: \.self) { _ in
                        HStack(alignment: .top, spacing: 12) {
                            Image("artBanner")
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .frame(width: 100)
                                .clipped()
                                .cornerRadius(12)

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
                                .padding(.vertical, 10)
                                HStack{
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Text("Join Challenge")
                                    }
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.primaryBg)
                                    }
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.showChallengeDetailView = true
                        }
                        
                    }
                }
                .padding(.top)
            }
            Spacer()
        }
        .sheet(isPresented: $viewModel.showChallengeDetailView) {
            ChallengeDetailView()
        }
    }
}

#Preview {
    ChallengeView()
}

