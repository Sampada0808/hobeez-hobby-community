import SwiftUI

struct AllPostView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(dummyPosts, id: \.self) { post in
                ContentPost(post: post)
            }
        }
    }
}

#Preview {
    AllPostView()
}
