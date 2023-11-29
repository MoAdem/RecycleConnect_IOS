//
//  articlelist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI


struct ArticleForm: View {
    var body: some View {
        // Your ArticleForm view content goes here
        Text("Article Form")
            .font(.title)
    }
}

// articlelist.swift
import SwiftUI

struct articlelist: View {
    @State private var searchText: String = ""
    @State private var isArticleFormPresented: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                        ForEach(0..<10) { _ in
                            NavigationLink(destination: articledetails()) {
                                VStack(alignment: .center) {
                                    Image("bag")
                                        .resizable()
                                        .frame(width: 140, height: 140)
                                        .cornerRadius(8)

                                    Text("Sac")
                                        .font(.headline)
                                        .foregroundColor(.primary)

                                    Text("Neuf")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .background(Color(.white))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top , 40)
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // Set the flag to present the ArticleForm view
                            isArticleFormPresented.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .clipShape(Circle())
                                .padding(.trailing , 50)
                        }
                        .sheet(isPresented: $isArticleFormPresented) {
                            articleform()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("              Rechercher un article                    ", text: $searchText)
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
    articlelist()
}
