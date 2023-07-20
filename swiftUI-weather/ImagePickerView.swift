//
//  ImagePickerView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/20/23.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var isShowingPhotoPicker = false
    @State private var selectedImage = UIImage(named: "image1")!
    var body: some View {
        VStack {
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 150,height: 150)
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            Spacer()
        }.navigationTitle("Profile")
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(selectedImage: $selectedImage)
            }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}


struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
  
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    return
                }
                photoPicker.selectedImage = compressedImage
            }else {
                //return alert /or message something wrong on selection
            }
            picker.dismiss(animated: true)
        }
        
    }
   
    
    
}
