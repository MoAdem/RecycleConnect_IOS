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
        ReservationPcCardView(reservationPc: ReservationPc(Nom_R: "Commande 1", id_Pc: "Point Collecte 1"))
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


