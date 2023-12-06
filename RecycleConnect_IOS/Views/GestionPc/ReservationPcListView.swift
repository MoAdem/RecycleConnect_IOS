//
//  ReservationPcListView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
import SwiftUI

struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
        NavigationView {
            ZStack{
                List {
                    ForEach(viewModel.reservationPcs.indices, id: \.self) { index in
                        let reservationPc = viewModel.reservationPcs[index]
                        ReservationPcCardView(reservationPc: reservationPc, viewModel: viewModel)
                            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                            .onTapGesture {
                                // Handle tap on the card if needed
                            }
                        
                            .id(index)
                        
                    }
                }
                .listStyle(InsetListStyle())
                .listRowBackground(Color.clear)
                .onAppear {
                    viewModel.getReservationPcsFromServer()
                }
            }
                
            }//.navigationBarBackButtonHidden(true)
        
    }
}
/*   .navigationTitle("Reservation PC")
   .navigationBarTitleDisplayMode(.inline)
   .alert(isPresented: $viewModel.showErrorMessages) {
       Alert(
           title: Text("Erreur"),
           message: Text("Une erreur s'est produite lors du chargement des données."),
           dismissButton: .default(Text("OK"))
       )
   }*/

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
