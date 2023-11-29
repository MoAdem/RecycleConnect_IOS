//
//  NavView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 29/11/2023.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: PcListView()) {
                    Text("Go to Pc")
                }

                NavigationLink(destination: LivraisonFormView()) {
                    Text("Go to Formulaire")
                }

                NavigationLink(destination: MappView()) {
                    Text("Go to Mapp")
                }
            }
           // .navigationTitle("Navigation Example")
        }
    }
}



struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
