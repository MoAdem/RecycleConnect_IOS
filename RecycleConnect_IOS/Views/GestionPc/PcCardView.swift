//
//  PcCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
import SwiftUI
import MapKit

struct PcCardView: View {
    let pc: PC
    @State private var isReservationActive: Bool = false
    @State private var isMapViewActive: Bool = false
    @ObservedObject var viewModel: ReservationPcViewModel

    var body: some View {
        VStack  {
            HStack {
                Button(action: {
                    // Actions à effectuer lors du clic sur l'image
                    isMapViewActive.toggle()
                }) {
                    Image("po")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                        .offset(x: 4)
                        .clipped()
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(pc.Nom_Pc)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    
                    
                    Text(pc.address_Pc)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Text(pc.address_mail_Pc)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    
                    Text(String(pc.numero_tel))
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }.padding(20)
                
                Spacer()
            
                    HStack{
                        Button(action: {
                            // Actions à effectuer lors du clic sur le bouton "Sélectionner"
                            //viewModel.createReservation(nomR: pc.Nom_Pc, idPc: pc.id)
                            viewModel.createReservation(nomR: "votre_Article", idPc: pc.id)
                            isReservationActive.toggle()
                        }) {
                            Text("Sélectionner")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 76, height: 33)
                                .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .cornerRadius(10)
                                .offset(x: 4 , y: 37)
                            
                        }
                        .background(
                            NavigationLink(
                                destination: ReservationPcListView(viewModel: viewModel),
                                isActive: $isReservationActive,
                                label: {
                                    EmptyView()
                                })
                            .hidden()
                        )
                    }
               
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
            )
            .shadow(radius: 4)
            .padding(5)
        }
        .background(
            NavigationLink(
                destination: MappView(mapRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: pc.x, longitude: pc.y), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), annotations: [AnnotationItem(annotation: MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: pc.x, longitude: pc.y), title: pc.Nom_Pc, subtitle: pc.address_Pc))]),
                isActive: $isMapViewActive) {
                EmptyView()
            }
            .hidden()
        )
    }
}

/*
import SwiftUI

struct PcCardView: View {
    let pc: PC
    @State private var isReservationActive: Bool = false
    @State private var isMapViewActive: Bool = false

    var body: some View {
        NavigationLink(destination: MappView(), isActive: $isMapViewActive) {
            HStack(spacing: 7) {
                Image("ImagePos")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()

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
                        Text(String(pc.numero_tel))  // Convertissez pc.numero_tel en String ici
                            .font(.body)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    Button(action: {
                        // Actions à effectuer lors du clic sur le bouton
                        isReservationActive.toggle()
                    }) {
                        NavigationLink(
                            destination: ReservationPcListView(),
                            isActive: $isReservationActive,
                            label: {
                                Text("Sélectionner")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 50)
                                    .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                    .cornerRadius(50)
                            })
                    }
                }
                .padding(16)
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding(8)
        }
        .onTapGesture {
            // Définissez ici le comportement lors du clic sur la carte
            isMapViewActive = true
        }
    }
}

struct PcCardView_Previews: PreviewProvider {
    static var previews: some View {
        PcCardView(pc: PcViewModel().pcs[0]) // Remplacez [0] par l'indice réel que vous souhaitez prévisualiser
    }
}
*/




