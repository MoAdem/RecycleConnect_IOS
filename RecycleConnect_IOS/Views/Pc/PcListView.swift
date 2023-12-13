//
//  PcListView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//
import SwiftUI

struct PcListView: View {
    @ObservedObject var viewModel = PcViewModel()
    @ObservedObject var reservationViewModel = ReservationPcViewModel() // Ajout de la viewModel pour les réservations

    var body: some View {
       // NavigationView {
            List(viewModel.pcs) { pc in
                Button(action: {
                    // Action à effectuer lors du clic sur PcCardView
                    // Vous pouvez ajouter la navigation vers ReservationPcListView ici si nécessaire
                }) {
                    PcCardView(pc: pc, viewModel: reservationViewModel) // Passage de la viewModel des réservations à PcCardView
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                }
            }
            .onAppear {
                viewModel.fetchData()
                reservationViewModel.getReservationPcsFromServer() // Charger les réservations lorsque la vue apparaît
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            //.navigationTitle("Points de Collecte")
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            
        }
   // }
}

struct PcListView_Previews: PreviewProvider {
    static var previews: some View {
        PcListView()
    }
}


