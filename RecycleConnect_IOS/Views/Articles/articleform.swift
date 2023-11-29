//
//  articleform.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct articleform: View {
    @State private var NomArticle: String = ""
    @State private var DescriptionArticle: String = ""
    @State private var EtatArticle: String = ""
    @State private var CategorieArticle: String = ""
    @State private var PhotoArticle: UIImage?

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
                            .padding(.bottom , 50)
                        
                    } else {
                        Image("addarticle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(.bottom , 50)
                    }
                    Spacer()
                }
                .onTapGesture {
                    // Present the image picker here
                }

                TextField("Nom de l'article", text: $NomArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 10)
                
                TextField("Description de l'article", text: $DescriptionArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 10)

                TextField("Etat de l'article", text: $EtatArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 10)
                
                TextField("Catégorie de l'article", text: $CategorieArticle)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                    .padding(.bottom , 20)

                Button(action: {
                    // Add your action here
                }) {
                    Text("Valider")
                        .foregroundColor(.white)
                        .padding(10)
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
    articleform()
}
