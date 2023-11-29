//
//  categorielist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct categorielist: View {
    @State private var searchText: String = ""
    @State private var isArticleFormPresented: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("      Rechercher une catégorie", text: $searchText)
                                .frame(width: 270)
                                .foregroundColor(.primary)
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color(.white))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                        .padding(.top , 30)
                    }  .frame(maxHeight: .infinity)
                    NavigationLink(destination: articlelist()) {
                        VStack(alignment: .center) {
                            Image("meubles")
                                .resizable()
                                .frame(width: 400, height: 200)
                                .cornerRadius(8)
                                .padding(.top , -30)
                            Text("Meubles")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.top , 20)
                                .padding(.bottom , -20)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10)
                    }
                    .padding(.top , 40)
                    NavigationLink(destination: articlelist()) {
                        VStack(alignment: .center) {
                            Image("livres")
                                .resizable()
                                .frame(width: 400, height: 200)
                                .cornerRadius(8)

                            Text("Livres")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.top , 20)
                                .padding(.bottom , -20)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10)
                    }
                    NavigationLink(destination: articlelist()) {
                        VStack(alignment: .center) {
                            Image("cuisine")
                                .resizable()
                                .frame(width: 400, height: 200)
                                .cornerRadius(8)

                            Text("Cuisine")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.top , 20)
                                .padding(.bottom , -20)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {isArticleFormPresented.toggle()}) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .clipShape(Circle())
                                .padding(.trailing , 50)
                        }
                        .sheet(isPresented: $isArticleFormPresented) { categorieform()}
                    }
                }
            }
        }
    }
}





#Preview {
    categorielist()
}
