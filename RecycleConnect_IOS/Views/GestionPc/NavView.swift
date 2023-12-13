//
//  NavView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 29/11/2023.
//

import SwiftUI

struct NavView: View {
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: PcListView()) {
                    Text("Go to Point Collecte")
                }

                NavigationLink(destination: LivraisonFormView(isEditing: $isEditing)) {
                    Text("Go to Formulaire")
                }
                NavigationLink(destination: DetailsLivListView()){
                    Text ("Go to Details Livraison")
                }
                NavigationLink(destination: ReservationPcListView()){
                    Text ("Go to Reservation")
                }


            }
        } 
    }
}


struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
/*NavigationLink(destination: MappView()) {
    Text("Go to Mapp")
}*/
