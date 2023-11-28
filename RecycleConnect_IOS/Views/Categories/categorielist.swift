//
//  categorielist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct categorielist: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: articlelist()) {
                    VStack(alignment: .center) {
                        Image("meubles")
                            .resizable()
                            .frame(width: 400, height: 200)
                            .cornerRadius(8)
                        
                        Text("Meubles")
                            .font(.headline)
                            .foregroundColor(.primary)
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
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                }
                
            }
    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            VStack {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    TextField("          Rechercher une catégorie                   ,", text: $searchText)
                                        .foregroundColor(.primary)
                                }
                                .padding(EdgeInsets(top: 10, leading: 6, bottom: 10, trailing: 6))
                                .background(Color(.white))
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                                .padding(.top , 50)
                            }
                            .frame(maxHeight: .infinity)
                        }
                    }
                }
            }
}

#Preview {
    categorielist()
}
