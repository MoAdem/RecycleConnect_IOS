//
//  PcCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import SwiftUI

struct PcCardView: View {
    let pc: PC

    var body: some View {
        HStack(spacing: 7) {
            Button(action: {
                print("Buton image clique!")
            }){
                Image( "ImagePos")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
            }

            VStack(alignment: .leading, spacing: 9) {
                Text(pc.Nom_Pc)
                    .font(.system(size: 16))
                    .fontWeight(.medium)

                HStack {
                    Spacer()
                    Text(pc.address_Pc)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text(pc.address_mail_Pc)
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text(pc.numero_tel)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                }

                Button(action: {
                    
                }) {
                Text("Sélectionner")
                 .font(.system(size: 20))
                 .foregroundColor(.white)
                 .frame(width: 150, height: 50)  // Réglez la largeur du bouton ici
                 .background(Color.green)
                 .cornerRadius(50)
                                }
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
    }
}

struct PcCardView_Previews: PreviewProvider {
    static var previews: some View {
        PcCardView(pc: samplePCs[0])
    }
}
*/

import SwiftUI

struct PcCardView: View {
    let pc: PC
    @State private var isReservationActive: Bool = false

    var body: some View {
        HStack(spacing: 7) {
            Button(action: {
                // Actions à effectuer lors du clic sur le bouton
                isReservationActive.toggle()
            }) {
                Image("ImagePos")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
            }

            VStack(alignment: .leading, spacing: 9) {
                Text(pc.Nom_Pc)
                    .font(.system(size: 16))
                    .fontWeight(.medium)

                HStack {
                    Spacer()
                    Text(pc.address_Pc)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text(pc.address_mail_Pc)
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text(pc.numero_tel)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                NavigationLink(
                    destination: ReservationPcListView(),
                    isActive: $isReservationActive,
                    label: {
                        Text("Sélectionner")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.green)
                            .cornerRadius(50)
                    }
                )
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(8)
    }
}

struct PcCardView_Previews: PreviewProvider {
    static var previews: some View {
        PcCardView(pc: samplePCs[0])
    }
}

