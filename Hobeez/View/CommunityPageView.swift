import SwiftUI

struct CommunityPageView: View {
    @State var viewModel  =  CommunityPageViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Chats")
                        .font(.system(size: 32, weight: .bold))
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            viewModel.showCreateGroupModel = true
                        }
                }
                .padding()
                TextField(" \(Image(systemName: "magnifyingglass")) Search for chats and people", text: $viewModel.searchName)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal,20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0..<20, id: \.self) { _ in
                            VStack {
                                CircularImage(imageName: "ArtistPerson", imageSize: 80)
                                    .onTapGesture {
                                        viewModel.showProfile = true
                                    }
                                Text("John")
                            }
                        }
                    }
                    .padding()
                }
                Divider()
                HStack{
                    Text("Recent Messages")
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                Divider()
                ScrollView(.vertical){
                    VStack(alignment: .leading) {
                        ForEach(0..<20) { _ in
                            HStack(alignment: .top){
                                CircularImage(imageName: "artBanner", imageSize: 50)
                                VStack(alignment: .leading) {
                                    Text(dummyCommunityGroup.groupName)
                                        .font(.system(size: 22,weight: .semibold))
                                        .padding(.bottom, 1)
                                    Text(dummyCommunityGroup.messages[0].text ?? "" )
                                        .font(.system(size: 12))
                                        .font(.caption)
                                }
                                Spacer()
                                Text("\(dummyCommunityGroup.messages[0].time)")
                            }
                        }
                        .onTapGesture {
                            viewModel.showChat = true
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .sheet(isPresented: $viewModel.showCreateGroupModel) {
                CreateGroupView()
            }
            .fullScreenCover(isPresented: $viewModel.showChat) {
                ChatView(message: .constant(""))
                    
            }
            .sheet(isPresented: $viewModel.showProfile) {
                ProfileDetailView()
            }
        }
    }
}

#Preview {
    CommunityPageView()
}
