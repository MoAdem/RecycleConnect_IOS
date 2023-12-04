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
                    Text("Go to Pc")
                }

                NavigationLink(destination: LivraisonFormView(isEditing: $isEditing)) {
                    Text("Go to Formulaire")
                }

                /*NavigationLink(destination: MappView()) {
                    Text("Go to Mapp")
                }*/
            }
        }
    }
}


struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
