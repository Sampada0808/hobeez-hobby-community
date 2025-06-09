import SwiftUI

struct ProfileCustomisationView: View {
    @State var viewModel = ProfileCustomisationViewModel()
    @StateObject var imageLoaderViewModel = ImageLoaderViewModel()
    var body: some View {
        VStack{
            Text("Profile")
                .font(.system(size: 30, weight: .bold))
                .padding()
            viewModel.avatar
                .resizable()
                .background()
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
            VStack(alignment: .leading){
                Text("Name")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(uiColor: .lightGray))
                TextField("Name", text: $viewModel.name )
                    .textFieldStyle(ProfileTextFieldStyle())
                Text("Bio")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(uiColor: .lightGray))
                    .padding(.vertical, 5)
                TextEditor(text: $viewModel.Bio)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.indigo.opacity(0.1))
                    )
                    .frame(height: 200)

            }
            .padding(.horizontal)
            Button {
                
            } label: {
                Text("Finish")
            }
            .padding(20)
            .buttonStyle(PrimaryButtonStyle())
            Button {
            } label: {
                Text("Skip for now")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
            }
            .padding(.top, 5)

            Spacer()
        }
        .photosPicker(isPresented: $viewModel.showLibrary, selection: $imageLoaderViewModel.imageSelection,matching: .images, photoLibrary: .shared())
        .onChange(of: imageLoaderViewModel.imageToUpload, { _, newValue in
            if let newValue = newValue{
                viewModel.avatar = Image(uiImage: newValue)
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
                viewModel.avatar = Image(uiImage: image)
            })
        }
        
    }
}

#Preview {
    ProfileCustomisationView()
}
