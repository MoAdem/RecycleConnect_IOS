//
//  articleform.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isImagePickerPresented: Bool


    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage?
        @Binding var isImagePickerPresented: Bool


        init(image: Binding<UIImage?>, isImagePickerPresented: Binding<Bool>) {
            _image = image
            _isImagePickerPresented = isImagePickerPresented
        }


        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = uiImage
            }
            isImagePickerPresented = false
        }


        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isImagePickerPresented = false
        }
    }


    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, isImagePickerPresented: $isImagePickerPresented)
    }


    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }


    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Update the view controller if needed
    }
}


struct articleform: View {
    @State private var NomArticle: String = ""
    @State private var DescriptionArticle: String = ""
    @State private var EtatArticle: String = ""
    @State private var ArticleArticle: String = ""
    @State private var PhotoArticle: UIImage?
    @State private var isImagePickerPresented = false
    @StateObject private var articleViewModel = ArticleViewModel()


    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    if PhotoArticle != nil {
                        Image(uiImage: PhotoArticle!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 50)
                    } else {
                        Image("addarticle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 50)
                    }
                    Spacer()
                }
                .onTapGesture {
                    isImagePickerPresented.toggle()
                }


                TextField("Nom de l'article", text: $NomArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom, 10)


                TextField("Description de l'article", text: $DescriptionArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom, 10)


                TextField("Etat de l'article", text: $EtatArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom, 10)


                TextField("Catégorie de l'article", text: $ArticleArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom, 20)


                Button(action: {
                    if let uiImage = PhotoArticle {
                            // Convert UIImage to Data
                            if let imageData = uiImage.jpegData(compressionQuality: 0.8) {
                                articleViewModel.PhotoArticleData = imageData
                            }
                        }


                        articleViewModel.CreateArticle { result in
                            switch result {
                            case .success(let article):
                                // Handle success, you may want to show an alert or navigate to a new view
                                print("Article created: \(article)")
                            case .failure(let error):
                                // Handle error, you may want to show an alert
                                print("Error creating article: \(error)")
                            }
                        }



                }) {
                    Text("Valider")
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $PhotoArticle, isImagePickerPresented: $isImagePickerPresented)
            }
            Spacer()
        }
    }


    private func loadImage() {
        // Handle the selected image
        guard let selectedImage = PhotoArticle else { return }
        // You can perform additional actions with the selected image if needed
        print("Selected Image: \(selectedImage)")
    }
}

#Preview {
    articleform()
}
