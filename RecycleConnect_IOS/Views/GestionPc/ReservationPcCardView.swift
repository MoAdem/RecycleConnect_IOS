//
//  ReservationPcCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import SwiftUI

struct ReservationPcCardView: View {
    let reservationPc: ReservationPc

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée dans cette Point Collecte  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.Nom_R)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.id_Pc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
        .swipeActions {
            Button("Supprimer") {
                // Action for Supprimer
                print("Supprimer")
            }
            .tint(.red)
        }
    }
}

struct ReservationPcCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcCardView(reservationPc: sampleReservationPcs[0])
    }
}

*/

/*
import SwiftUI


struct ReservationPcCardView: View {
    let reservationPc: ReservationPc

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée dans cette Point Collecte  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.Nom_R)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.id_Pc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
        .swipeActions {
            Button("Supprimer") {
                // Action de suppression
                print("Supprimer")
            }
            .tint(.red)
        }
    }
}

struct ReservationPcCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcCardView(reservationPc: ReservationPcViewModel().reservationPcs[0])
    }
}
  */
/*
import SwiftUI

// Vue pour afficher une carte de réservation PC
struct ReservationPcCardView: View {
    let reservationPc: ReservationPc

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée dans cette Point Collecte  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.Nom_R)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.id_Pc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
        .swipeActions {
            Button("Supprimer") {
                // Action de suppression
                print("Supprimer")
            }
            .tint(.red)
        }
    }
}

// Aperçu de la vue
struct ReservationPcCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcCardView(reservationPc: ReservationPcViewModel().reservationPcs[0])
    }
}
*/
/*
import SwiftUI
struct ReservationPcCardView: View {
    let reservationPc: ReservationPc
    @State private var showAlert = false

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée dans cette Point Collecte  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.Nom_R)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.id_Pc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
        .contextMenu {
            Button("Supprimer") {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Confirmer la suppression"),
                message: Text("Êtes-vous sûr de vouloir supprimer cette réservation ?"),
                primaryButton: .destructive(Text("Supprimer")) {
                    // Action de suppression (appelez la méthode de suppression ici)
                    print("Supprimer")
                },
                secondaryButton: .cancel()
            )
        }
    }
}
*/
import SwiftUI

struct ReservationPcCardView: View {
    let reservationPc: ReservationPc
    @State private var showConfirmationView = false
    @ObservedObject var viewModel: ReservationPcViewModel

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée dans cette Point Collecte  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.Nom_R)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(reservationPc.id_Pc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
        .contextMenu {
            Button("Supprimer") {
                showConfirmationView = true
            }
        }
        .background(
            ConfirmationView(
                title: "Confirmer la suppression",
                message: "Êtes-vous sûr de vouloir supprimer cette réservation ?",
                isPresented: $showConfirmationView,
                onConfirm: {
                    // Action de suppression (appelez la méthode de suppression ici)
                    viewModel.deleteReservationPc(id: reservationPc.safeID)
                }
            )
        )
    }
}

struct ConfirmationView: View {
    let title: String
    let message: String
    @Binding var isPresented: Bool
    var onConfirm: () -> Void

    var body: some View {
        if isPresented {
            VStack {
                Text(title)
                    .font(.title)
                    .padding()

                Text(message)
                    .padding()

                HStack {
                    Button("Annuler") {
                        isPresented = false
                    }
                    .padding()

                    Button("Supprimer") {
                        onConfirm()
                        isPresented = false
                    }
                    .foregroundColor(.red)
                    .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding()
        }
    }
}


