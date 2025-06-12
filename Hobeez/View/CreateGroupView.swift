import SwiftUI

struct CreateGroupView: View {
    @State var viewModel = CreateGroupViewModel()
    @StateObject var imageLoaderViewModel = ImageLoaderViewModel()
    var body: some View {
        VStack {
            Text("Create Group")
                .font(.system(size: 25, weight: .bold))
                .padding()
            Text("Add Photo")
            viewModel.groupImage
                .resizable()
                .background()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .clipShape(
                    Circle()
                )
                .background(
                    Circle()
                        .stroke(Color(uiColor: .lightGray), lineWidth: 2)
                )
                .overlay(
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(8)
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        ),
                    alignment: .bottomTrailing
                )
                .padding(.vertical, 20)
                .onTapGesture {
                    viewModel.showImageOptions = true
                }
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Group Name")
                        .font(.system(size: 18, weight: .semibold))
                    TextField("Enter group name", text: $viewModel.groupName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.system(size: 18, weight: .semibold))
                    TextField("What is this group about?", text: $viewModel.groupDescription)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
                HStack {
                    Text("Category")
                        .font(.system(size: 18, weight: .semibold))
                    Picker("Select category", selection: $viewModel.selectedCategory) {
                        ForEach(Hobbies.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Toggle("Private Group", isOn: $viewModel.isPrivate)
                    .padding(.top, 10)
                Button(action: {
                    
                }) {
                    Text("Create Group")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.top, 20)
                
            }.padding()
            
            
                .photosPicker(isPresented: $viewModel.showLibrary, selection: $imageLoaderViewModel.imageSelection,matching: .images, photoLibrary: .shared())
                .onChange(of: imageLoaderViewModel.imageToUpload, { _, newValue in
                    if let newValue = newValue{
                        viewModel.groupImage = Image(uiImage: newValue)
                    }
                })
                .confirmationDialog("Upload an image to your recipe", isPresented: $viewModel.showImageOptions, titleVisibility: .visible) {
                    Button {
                        viewModel.showLibrary = true
                    } label: {
                        Text("Upload from library")
                    }
                    Button {
                        viewModel.showCamera = true
                    } label: {
                        Text("Upload from Camera")
                    }
                    
                }
                .fullScreenCover(isPresented: $viewModel.showCamera) {
                    CameraPicker(action: { image in
                        viewModel.groupImage = Image(uiImage: image)
                    })
                }
        }
    }
}

#Preview {
    CreateGroupView()
}
