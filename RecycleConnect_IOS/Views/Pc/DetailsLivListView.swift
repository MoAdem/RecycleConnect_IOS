//
//  DetailsLivListView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI

struct DetailsLivListView: View {
    @ObservedObject var livraisonViewModel = LivraisonViewModel()
    

    var body: some View {
        List(livraisonViewModel.livraisons) { livraison in
            DetailsLivCardView(livraison: livraison, viewModel: livraisonViewModel)
                .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
        }
        .listStyle(InsetListStyle())
        .listRowBackground(Color.clear)
        .onAppear {
            livraisonViewModel.getLivraisonsFromServer()
        }
        //.navigationTitle("Details Livraison")
        //.navigationBarTitleDisplayMode(.inline)

    }
}


struct DetailsLivListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsLivListView()
    }
}

