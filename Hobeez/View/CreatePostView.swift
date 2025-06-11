import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @State var viewModel = CreatePostViewModel()
    @StateObject var imageLoaderViewModel = ImageLoaderViewModel()
    var body: some View {
        VStack(alignment: .leading){
            Text("What's New")
                .font(.system(size: 25, weight: .semibold))
                .padding(.top, 20)
            
            ZStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray.opacity(0.2))
                        .frame(height: 200)
                    Image(systemName: "photo.fill")
                    if let displayImage = viewModel.displayImage{
                        displayImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .clipped()
                    }
                }
                .onTapGesture {
                    viewModel.showImageOptions = true
                }
                
            }
            Text("Caption")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top)
            TextField("Description about the post", text: $viewModel.caption)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Button {
                
            } label: {
                Text("Add")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 15)

            Spacer()
        }
        .padding(.horizontal)
        .photosPicker(isPresented: $viewModel.showLibrary, selection: $imageLoaderViewModel.imageSelection,matching: .images, photoLibrary: .shared())
        .onChange(of: imageLoaderViewModel.imageToUpload, { _, newValue in
            if let newValue = newValue{
                viewModel.displayImage = Image(uiImage: newValue)
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
                viewModel.displayImage = Image(uiImage: image)
            })
        }
        
       
    }
}

#Preview {
    CreatePostView()
}
