//
//  DetailsLivListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//


import SwiftUI
struct DetailsLivListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { index in
                    DetailsLivCardView()
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                }
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Details Livraison")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailsLivListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsLivListView()
    }
}

/*
import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var viewModel = LivraisonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.livraisons, id: \._id) { livraison in
                DetailsLivCardView(livraison: livraison)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .onAppear {
                viewModel.fetchData()
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
*/
/*
import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var viewModel = LivraisonViewModel()

    var body: some View {
        NavigationView {
            List($viewModel.livraisonns, id: \._id) { livraison in
                DetailsLivCardView(livraison: livraison)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .onAppear {
                viewModel.fetchData()
                print("Number of livraisons: \(viewModel.livraisons.count)")
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

*/
