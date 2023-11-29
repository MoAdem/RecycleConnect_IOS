//
//  PcListView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI
struct PcListView: View {
    let pcs: [PC] = samplePCs

    var body: some View {
        NavigationView {
            List(pcs) { pc in
                PcCardView(pc: pc)
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
            // .navigationTitle("Points de Collecte")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PcListView_Previews: PreviewProvider {
    static var previews: some View {
        PcListView()
    }
}


