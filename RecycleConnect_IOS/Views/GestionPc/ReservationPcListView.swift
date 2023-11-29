//
//  ReservationPcListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import SwiftUI

struct ReservationPcListView: View {
    let reservationPcs: [ReservationPc] = sampleReservationPcs

    var body: some View {
        NavigationView {
            List(reservationPcs) { reservationPc in
                ReservationPcCardView(reservationPc: reservationPc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            //.navigationTitle("Reservation PC")
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
import SwiftUI
struct ReservationPcListView: View {
    let reservationPcs: [ReservationPc] = sampleReservationPcs

    var body: some View {
        NavigationView {
            List(reservationPcs) { reservationPc in
                ReservationPcCardView(reservationPc: reservationPc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .listStyle(InsetListStyle()) // Apply InsetListStyle
            .listRowBackground(Color.clear) // Set the background color of List items
            .background(
                Image("background_splash_screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            //.navigationTitle("Reservation PC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ReservationPcListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPcListView()
    }
}

