import SwiftUI

struct PostDetailView: View {
    let post : PostModel = dummyPosts[0]
    @Binding var comment : String
    var body: some View {
        VStack{
            ContentPost(post: post)
                .padding(.bottom)
            VStack(alignment: .leading) {
                ForEach(post.comments, id: \.self) { details in
                    HStack(alignment: .top) {
                        Text(details.user)
                            .font(.headline)
                        Text(details.comment)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer()
            HStack {
                TextField("Comment", text: $comment)
                    
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(45))
            }
            .padding(.horizontal, 20)
            
        }
    }
}

#Preview {
    PostDetailView(comment: .constant(""))
}
