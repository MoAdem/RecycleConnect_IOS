//
//  ReservationPcCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
import SwiftUI

struct ReservationPcCardView: View {
    let reservationPc: ReservationPc
    @State private var showConfirmationView = false
    @ObservedObject var viewModel: ReservationPcViewModel

    var body: some View {
        
        
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                HStack {
                    Text("Votre commande a été affectée dans le Point Collecte  '\(reservationPc.nomR)'")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "checkmark.circle.fill") // Symbole de validation
                        .font(.system(size: 20))
                        .foregroundColor(.green)
                        .padding(.leading, 4) // Espacement entre le texte et l'icône
                }
            

              /*  Text(reservationPc.nomR)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)*/

               /* Text(reservationPc.idPc)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)*/
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        /*.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
        )*/

        .shadow(radius: 4)
        .padding(8)
        .swipeActions(edge: .trailing) {
            Button {
               if let index = viewModel.reservationPcs.firstIndex(where: { $0.id == reservationPc.id }) {
                    viewModel.deleteReservationPc(at: index)
                } else {
                    print("Impossible de trouver l'index de la réservation à supprimer.")
                }
            } label: {
                Image(systemName: "trash")
                    .tint(.red)
            }
        }
    }
}


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






