import SwiftUI

struct AllPostView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(dummyPosts, id: \.self) { post in
                VStack {
                    Image(post.postImageName)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .overlay(
                            HStack{
                                CircularImage(imageName: "ArtistPerson", imageSize: 50)
                                Text(post.createdBy.userName)
                                    .foregroundStyle(.white)
                            }
                                .padding(10)
                            ,
                            alignment: .topLeading
                        )
                    HStack{
                        Image("like")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image("comment")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Spacer()
                        Image("save")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.horizontal, 10)
                    
                    (
                        Text("\(post.createdBy.userName): ")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        +
                        Text(post.caption)
                    )
                    .padding(.leading, 10)
                    .multilineTextAlignment(.leading)
                    
                }
            }
        }
    }
}

#Preview {
    AllPostView()
}
