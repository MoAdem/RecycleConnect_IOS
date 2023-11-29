//
//  categorieform.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct categorieform: View {
    @State private var NomCategorie: String = ""
    @State private var NbreTotalArticles: String = ""
    @State private var PhotoCategorie: UIImage?

    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    if PhotoCategorie != nil {
                        Image(uiImage: PhotoCategorie!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .padding(.bottom , 50)
                        
                    } else {
                        Image("addarticle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .padding(.bottom , 50)
                    }
                    Spacer()
                }
                .onTapGesture {
                    // Present the image picker here
                }

                TextField("Nom de la catégorie", text: $NomCategorie)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 10)
                
                TextField("Nombre total des articles", text: $NbreTotalArticles)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 50)

                Button(action: {
                    // Add your action here
                }) {
                    Text("Valider")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .cornerRadius(10)
                }
                .padding(.top , 20)
            }
            Spacer()
        }
    }
}


#Preview {
    categorieform()
}
