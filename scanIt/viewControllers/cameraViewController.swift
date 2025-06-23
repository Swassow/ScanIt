import SwiftUI

struct cameraViewController: View {
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var selectedSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showActionSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = selectedImage {
                    let filteredImage = OpenCVWrapper.grayscaleImg(image)
                    Image(uiImage: filteredImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Tap the button to select a photo")
                        .font(.largeTitle)
                        .padding()
                }
            }
            .navigationTitle("Take photo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button(action: {
                    showActionSheet = true
                }) {
                    Image(systemName: "plus.app")
                }
            )
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Select Photo Source"),
                    buttons: [
                        .default(Text("Camera")) {
                            selectedSourceType = .camera
                            isImagePickerPresented = true
                        },
                        .default(Text("Photo Library")) {
                            selectedSourceType = .photoLibrary
                            isImagePickerPresented = true
                        },
                        .cancel()
                    ]
                )
            }
            .sheet(isPresented: $isImagePickerPresented) {
                imagePicker(selectedImage: $selectedImage, sourceType: selectedSourceType)
            }
        }
    }
}
