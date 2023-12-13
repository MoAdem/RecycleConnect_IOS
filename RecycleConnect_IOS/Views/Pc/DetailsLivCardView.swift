//
//  DetailsLivCardView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI

struct DetailsLivCardView: View {
    var livraison: Livraisonn
    @ObservedObject var viewModel: LivraisonViewModel
    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée avec succès sous les coordonnées  ")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)


                HStack(alignment: .center) {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                    Text(livraison.Nom_Client)
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }

                HStack(alignment: .center) {
                    Image(systemName: "mail.fill")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                    Text(livraison.address_mail_Client)
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }

               /* Text(livraison.address_mail_Client)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)*/

                HStack(alignment: .center){
                    Image(systemName: "phone.fill")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                    Text("\(livraison.numero_Client)")
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                HStack(alignment: .center) {
                    Image(systemName: "house.fill")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                    Text(livraison.address_Client)
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
        )
        .shadow(radius: 4)
        .padding(8)
        .swipeActions {
            Button("Supprimer", systemImage: "trash") {
             
                viewModel.deleteLivraisonFromServer(livraisonID: livraison.id)
            }
            .tint(.red)

            Button("Modifier", systemImage: "pencil") {
                isEditing.toggle()
            }
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
        }
        
        /*background(
            NavigationLink(
                destination: LivraisonFormView(livraison: livraison, isEditing: $isEditing),
                isActive: $isEditing
            ) {
                EmptyView()
            }
            .hidden()
        )*/
        
        .background(
            NavigationLink(
                destination: LivraisonFormView(livraison: livraison, isEditing: $isEditing),
                isActive: $isEditing,
                label: {
                    EmptyView()
                })
                .hidden()
        )
        

    }
}
