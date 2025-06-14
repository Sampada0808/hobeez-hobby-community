import SwiftUI

struct LeaderboardRow: View {
    let rank: Int
    let userName: String
    let score: Int

    var body: some View {
        HStack {
            Text("#\(rank)")
                .fontWeight(.bold)
                .frame(width: 40)

            Image("ArtistPerson")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            Text(userName)
                .fontWeight(.medium)

            Spacer()

            Text("\(score) pts")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
