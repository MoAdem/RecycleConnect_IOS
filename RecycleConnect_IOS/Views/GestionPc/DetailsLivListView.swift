//
//  DetailsLivListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//

import SwiftUI

/*
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
}*/
/*
import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var livraisonViewModel = LivraisonViewModel()

    var body: some View {
       NavigationView {
            List(livraisonViewModel.livraisons) { livraison in
                NavigationLink(destination: DetailsLivCardView(livraison: livraison)) {
                    DetailsLivCardView(livraison: livraison)
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
            .onAppear {

                livraisonViewModel.getLivraisonsFromServer()
            }
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
*/
/*

struct DetailsLivListView: View {
    @ObservedObject var livraisonViewModel = LivraisonViewModel()

    var body: some View {
        NavigationView {
            List(livraisonViewModel.livraisons) { livraison in
                Button(action: {
                    // Ajoutez ici le code que vous souhaitez exécuter lors de l'appui sur un élément de la liste
                }) {
                    DetailsLivCardView(livraison: livraison)
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
            .onAppear {
                livraisonViewModel.getLivraisonsFromServer()
            }
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
*/
/*
import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var livraisonViewModel = LivraisonViewModel()

    var body: some View {
        NavigationView {
            List(livraisonViewModel.livraisons) { livraison in
                NavigationLink(destination: DetailsLivCardView(livraison: livraison)) {
                    DetailsLivCardView(livraison: livraison)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                }
                .accentColor(.blue) // Changer la couleur lorsqu'il est sélectionné
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear {
                livraisonViewModel.getLivraisonsFromServer()
            }
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
*/
import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var livraisonViewModel = LivraisonViewModel()

    var body: some View {
        NavigationView {
            List(livraisonViewModel.livraisons) { livraison in
                DetailsLivCardView(livraison: livraison)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear {
                livraisonViewModel.getLivraisonsFromServer()
            }
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

