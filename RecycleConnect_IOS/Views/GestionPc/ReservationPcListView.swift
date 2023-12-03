//
//  ReservationPcListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//

/*
import SwiftUI

struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.reservationPcs) { reservationPc in
                ReservationPcCardView(reservationPc: reservationPc)
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
                viewModel.getReservationPcsFromServer()
            }
            .navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ReservationPcListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcListView()
    }
}
*/

/*
import SwiftUI

struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.reservationPcs) { reservationPc in
                ReservationPcCardView(reservationPc: reservationPc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .onAppear {
                viewModel.getReservationPcsFromServer()
            }
            .navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ReservationPcListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcListView()
    }
}
*/
/*
import SwiftUI

// Vue pour afficher la liste des réservations PC
struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.reservationPcs) { reservationPc in
                ReservationPcCardView(reservationPc: reservationPc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .onAppear {
                viewModel.getReservationPcsFromServer()
            }
            .navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Aperçu de la vue
struct ReservationPcListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcListView()
    }
}
*/
/*
import SwiftUI

struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.reservationPcs.indices, id: \.self) { index in
                    let reservationPc = viewModel.reservationPcs[index]
                    ReservationPcCardView(reservationPc: reservationPc)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                        .onTapGesture {
                            // Handle tap on the card if needed
                        }
                        .contextMenu {
                            Button("Supprimer") {
                                deleteReservation(at: index)
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Supprimer") {
                                deleteReservation(at: index)
                            }
                            .tint(.red)
                        }
                        .id(index) // Utilisation de l'index comme identifiant
                }
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .onAppear {
                viewModel.getReservationPcsFromServer()
            }
            .navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.showErrorMessages) {
                Alert(
                    title: Text("Erreur"),
                    message: Text("Une erreur s'est produite lors du chargement des données."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func deleteReservation(at index: Int) {
        guard index < viewModel.reservationPcs.count else {
            return
        }
        let reservationPc = viewModel.reservationPcs[index]
        viewModel.deleteReservationPc(id: reservationPc.safeID)
    }
}
*/
import SwiftUI
struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()
    @State private var showAddReservationView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.reservationPcs.indices, id: \.self) { index in
                    let reservationPc = viewModel.reservationPcs[index]
                    ReservationPcCardView(reservationPc: reservationPc, viewModel: viewModel)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                        .onTapGesture {
                            // Handle tap on the card if needed
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Supprimer") {
                                viewModel.deleteReservationPc(id: reservationPc.safeID)
                            }
                            .tint(.red)
                        }
                        .id(index)
                }
            }
            .listStyle(InsetListStyle())
            .listRowBackground(Color.clear)
            .onAppear {
                viewModel.getReservationPcsFromServer()
            }
            .navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button(action: {
                    // Action pour ajouter une nouvelle réservation (si nécessaire)
                    showAddReservationView = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .alert(isPresented: $viewModel.showErrorMessages) {
                Alert(
                    title: Text("Erreur"),
                    message: Text("Une erreur s'est produite lors du chargement des données."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .sheet(isPresented: $showAddReservationView) {
            // Afficher ici la vue pour ajouter une nouvelle réservation, si nécessaire
        }
    }
}




