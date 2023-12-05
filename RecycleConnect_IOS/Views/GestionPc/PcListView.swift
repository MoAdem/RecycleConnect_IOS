//
//  PcListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import SwiftUI

struct PcListView: View {
    let pcs: [PC] = samplePCs

    var body: some View {
        NavigationView {
            List(pcs) { pc in
                Button(action: {
                    // Action to perform when PcCardView is tapped
                    // Navigate to ReservationPcListView here if needed
                }) {
                    PcCardView(pc: pc)
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
            .navigationTitle("Points de Collecte")
             .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct PcListView_Previews: PreviewProvider {
    static var previews: some View {
        PcListView()
    }
}

*/

import SwiftUI

struct PcListView: View {
    @ObservedObject var viewModel = PcViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pcs) { pc in
              /*  NavigationLink(destination: PcCardView(pc: pc)) {
                    EmptyView()
                        .frame(width: 0, height: 0)
                }*/
               // .buttonStyle(PlainButtonStyle())

                Button(action: {
                    // Action à effectuer lors du clic sur PcCardView
                    // Vous pouvez ajouter la navigation vers ReservationPcListView ici si nécessaire
                }) {
                    PcCardView(pc: pc)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .navigationTitle("Points de Collecte")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PcListView_Previews: PreviewProvider {
    static var previews: some View {
        PcListView()
    }
}/*
import SwiftUI

struct PcListView: View {
    @ObservedObject var viewModel = PcViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pcs) { pc in
                PcCardView(pc: pc)
            }
            .onAppear {
                viewModel.fetchData()
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .navigationTitle("Points de Collecte")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PcListView_Previews: PreviewProvider {
    static var previews: some View {
        PcListView()
    }
}
*/
