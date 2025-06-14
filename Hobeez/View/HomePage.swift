import SwiftUI

struct HomePage: View {
    @State var viewModel = HomePageViewModel()
    @Environment(TabManager.self) var tabManager : TabManager
    @AppStorage("isUserLoggedIn") var isUserLoggedIn = true
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    CircularImage(imageName: "ArtistPerson", imageSize: 80)
                        .onTapGesture {
                            tabManager.selectedTab = 3
                        }
                    VStack(alignment: .leading) {
                        Text("Welcome Back,")
                            .foregroundStyle(Color(uiColor: .gray))
                        Text("Lauren Mcnive")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .padding(.trailing , UIScreen.main.bounds.width / 5)
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            isUserLoggedIn = false
                        }
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                HStack(spacing: 20) {
                    Button {
                        viewModel.selectedContentType = .forYou
                    } label: {
                        Text(ContentTypes.forYou.title)
                    }
                    .buttonStyle(RoundedButtonStyle(bgColor: viewModel.selectedContentType == .forYou ? .primaryBg : .gray, textColor: viewModel.selectedContentType == .forYou ? .white : .black, opacity: viewModel.selectedContentType == .forYou ? 1 : 0.1))
                    
                    Button {
                        viewModel.selectedContentType = .mostPopular
                    } label: {
                        Text(ContentTypes.mostPopular.title)
                    }
                    .buttonStyle(RoundedButtonStyle(bgColor: viewModel.selectedContentType == .mostPopular ? .primaryBg : .gray, textColor: viewModel.selectedContentType == .mostPopular ? .white : .black, opacity: viewModel.selectedContentType == .mostPopular ? 1 : 0.1))
                    Button {
                        viewModel.showCreatePost = true
                    } label: {
                        Text("+ Create")
                    }
                    .buttonStyle(RoundedButtonStyle(bgColor: .bgTints, textColor: .black , opacity: 0.3))

                }
                .padding()
                if viewModel.selectedContentType == .forYou {
                    HStack{
                        Text("Current Challenges")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.leading, 20)
                            .padding(.bottom, 0)
                        Spacer()
                        Text("4 active")
                            .padding(.trailing, 20)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleChallenges) { data in
                                VStack(alignment: .leading, spacing: 8) {
                                    ZStack(alignment: .topTrailing) {
                                        Image(data.bannerImageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 230, height: 120)
                                            .clipped()
                                            .clipShape(RoundedRectangle(cornerRadius: 16))

                                        HStack(spacing: 4) {
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.white)
                                            Text("\(data.participantsCount)")
                                                .foregroundStyle(.white)
                                        }
                                        .font(.caption)
                                        .padding(8)
                                        .background(.black.opacity(0.5))
                                        .clipShape(Capsule())
                                        .padding(8)
                                    }

                                    Text(data.name)
                                        .font(.headline)

                                    Text("by: \(data.createdBy)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                }
                                .onTapGesture(perform: {
                                    viewModel.showChallengeDetailView = true
                                })
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.gray.opacity(0.1))
                                )
                                .frame(width: 260)
                            }
                        }
                        .padding(.horizontal)
                    }
                    HStack {
                        Text("Posts")
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                        Button {
                            viewModel.showAllPosts = true
                        } label: {
                            Text("View All")
                        }
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleChallenges) { data in
                                VStack(alignment: .leading, spacing: 8) {
                                    ZStack(alignment: .topTrailing) {
                                        Image(data.bannerImageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 120, height: 120)
                                            .clipped()
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                    }

                                    Text(data.name)
                                        .font(.headline)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        

                                    Text("by: \(data.createdBy)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                }
                                .onTapGesture {
                                    viewModel.showDetailedPost = true
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.gray.opacity(0.1))
                                )
                                .frame(width: 150)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                else {
                    ScrollView(.vertical) {
                        ForEach(dummyPosts) { post in
                            ContentPost(post: post)
                        }
                    }
                }
                
                
                
                Spacer()
            }
            .sheet(isPresented: $viewModel.showCreatePost, content: {
                CreatePostView()
            })
            .sheet(isPresented: $viewModel.showDetailedPost, content: {
                PostDetailView(comment: .constant(""))
            })
            .navigationDestination(isPresented: $viewModel.showChallengeDetailView) {
                ChallengeDetailView()
            }
            .navigationDestination(isPresented: $viewModel.showAllPosts) {
                AllPostView()
            }
            
        }
        
    }
}

#Preview {
    HomePage()
        .environment(TabManager())
}
