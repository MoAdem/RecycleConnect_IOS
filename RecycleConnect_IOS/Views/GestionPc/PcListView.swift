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
                PcCardView(pc: pc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
            .background(Image("background_splash_screen")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all))
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
/*
import SwiftUI

struct PcListView: View {
    let pcs: [PC] = samplePCs
    @State private var isReservationActive: Bool = false

    var body: some View {
        NavigationView {
            List(pcs) { pc in
                NavigationLink(
                    destination: ReservationPcListView(),
                    isActive: $isReservationActive,
                    label: {
                        PcCardView(pc: pc)
                            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                    }
                )
            }
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
    let pcs: [PC] = samplePCs

    var body: some View {
        NavigationView {
            List(pcs) { pc in
                PcCardView(pc: pc)
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
            }
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