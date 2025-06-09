import SwiftUI

struct HobbySelectionView: View {
    @State var viewModel = HobbySelectionViewModel()
    
    fileprivate func HobbyGridLayout() -> some View{
        LazyVGrid(columns: viewModel.columns) {
            ForEach(viewModel.hobbyData) { hobby in
                let isSelected = viewModel.selectedHobbies.contains(hobby.id)
                
                VStack {
                    hobby.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding()
                    Text(hobby.name)
                        .font(.system(size: 15))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .truncationMode(.tail)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 10)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSelected ? hobby.bgColor.opacity(0.5) : Color(uiColor: .lightGray).opacity(0.1))
                }
                .onTapGesture {
                    if isSelected {
                        viewModel.selectedHobbies.remove(hobby.id)
                    } else {
                        viewModel.selectedHobbies.insert(hobby.id)
                    }
                }
            }
        }
        .padding()
        .frame(width: 400, height: 400)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Select hobbies & Interests.")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 50)
                    .padding(.leading, 40)
                    .padding(.bottom, 40)
                HobbyGridLayout()
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.showProfilepage = true
                    } label: {
                        Text("Next")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    Spacer()
                }
                .padding(.vertical, 50)
                Spacer()
                
            }
            .navigationDestination(isPresented: $viewModel.showProfilepage) {
                ProfileCustomisationView()
        }
        
        }
    }
}

#Preview {
    HobbySelectionView()
}
