import SwiftUI

struct ChallengeDetailView: View {
    let challenge : ChallengeModel =  ChallengeModel(
        name: "Sketch Your Pet",
        participantsCount: 112,
        createdBy: "MiaMassie",
        participantUsernames: ["artbyme", "sketchqueen", "doodlebro"],
        bannerImageName: "artBanner",
        description: "Draw or paint a portrait of your pet in your unique style!",
        startDate: Date().addingTimeInterval(-3600 * 24 * 2),
        hobby: .art
    )
    var body: some View {
        VStack {
            Text(challenge.name)
                .font(.system(size: 24, weight: .bold))
                .padding()
            Image(challenge.bannerImageName)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            (
                Text("\(challenge.createdBy): ")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                +
                Text(challenge.description ?? "")
            )
            .multilineTextAlignment(.leading)
            .padding()
            Rectangle()
                .fill(Color(uiColor: .lightGray).opacity(0.5))
                .frame(width: .infinity, height: 1)
                .padding(.bottom, 10)
            ScrollView(.vertical) {
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                            Text("Nolan Bator")
                        Text("I will draw my dog in cartoonish format")
                    }
                }
            }
            Button {
                
            } label: {
                Text("Join Now")
            }
            .buttonStyle(PrimaryButtonStyle())

            Spacer()

        }
    }
}

#Preview {
    ChallengeDetailView()
}
