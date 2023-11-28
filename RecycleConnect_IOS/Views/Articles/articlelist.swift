//
//  articlelist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct articlelist: View {
    @State private var searchText: String = ""
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                    ForEach(0..<10) { _ in
                        NavigationLink(destination: articledetails()) {
                            VStack(alignment: .center) {
                                Image("bag")
                                    .resizable()
                                    //.scaledToFit()
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
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                VStack {
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                        TextField("              Rechercher un article                   ,", text: $searchText)
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
