import SwiftUI

struct ChatView: View {
    @Binding var message : String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .padding(.trailing, 10)
                    .onTapGesture {
                        dismiss()
                    }

                CircularImage(imageName: artGroup.groupImage, imageSize: 50)
                    .padding(.trailing, 10)

                Text(artGroup.groupName)
                    .font(.system(size: 20, weight: .bold))

                Spacer()

                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(10)

            Divider()

            // Message List
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(artGroup.message) { message in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.sender.userName)
                                .font(.caption)
                                .foregroundColor(.gray)

                            if let text = message.text {
                                Text(text)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                            }

                            if let imageName = message.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 250)
                                    .cornerRadius(10)
                            }

                            Text(message.time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding(.top, 2)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
            }
            HStack {
                TextField("Enter your message", text: $message)
                    
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(45))
            }
            .padding(.horizontal, 20)
            Spacer()
        }

    }
}

#Preview {
    ChatView(message: .constant(""))
}
