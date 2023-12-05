//
//  categorielist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

import URLImage

struct categorielist: View {
    @StateObject private var categorieViewModel = CategorieViewModel()
    @State private var isCategorieFormPresented: Bool = false
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack{
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Rechercher une catégorie", text: $searchText)
                                .frame(width: 270)
                                .foregroundColor(.primary)
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color(.white))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                        .padding(.top , -30)

                        ForEach(categorieViewModel.categories) { categorie in
                            NavigationLink(destination: articlelist()) {
                                CategorieRowView(categorie: categorie)
                            }
                        }
                    }
                    .padding(.top, 40)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { isCategorieFormPresented.toggle() }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .clipShape(Circle())
                                .padding(.trailing, 50)
                        }
                        .sheet(isPresented: $isCategorieFormPresented) {
                            categorieform()
                        }
                    }
                }
            }
            .onAppear {
                categorieViewModel.GetAllCategories()
            }
        }
    }
}

struct CategorieRowView: View {
    var categorie: categorie

    var body: some View {
        NavigationLink(destination: articlelist()) {
            VStack(alignment: .center, spacing: 8) {
                URLImage(categorie.PhotoCategorie, content: { image in
                                   image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 200)
                        .cornerRadius(8)
                })
                Text(categorie.NomCategorie)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.top, 20)
                    .padding(.bottom, -20)
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
        }
    }
}




#Preview {
    categorielist()
}
