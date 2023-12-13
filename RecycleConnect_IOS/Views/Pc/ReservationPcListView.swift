//
//  ReservationPcListView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//
import SwiftUI

struct ReservationPcListView: View {
    @ObservedObject var viewModel = ReservationPcViewModel()

    var body: some View {
       // NavigationView {
            ZStack{
                List {
                    ForEach(viewModel.reservationPcs.indices, id: \.self) { index in
                        let reservationPc = viewModel.reservationPcs[index]
                        ReservationPcCardView(reservationPc: reservationPc, viewModel: viewModel)
                            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 4, trailing: 4))
                            .onTapGesture {
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
                
            //}
        
    }
}


