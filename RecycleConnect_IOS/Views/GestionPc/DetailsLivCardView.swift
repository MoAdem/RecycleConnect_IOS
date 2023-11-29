//
//  DetailsLivCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//

import SwiftUI

struct DetailsLivCardView: View {
    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée avec succès sous les coordonnées  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("KARIM")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("karim.kekli@esprit.tn")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("23363948")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("HZ")
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
            }
            .tint(.red)

            Button("Modifier") {
                isEditing.toggle()
            }
            .tint(.blue)
        }
        .background(
            NavigationLink(
                destination: LivraisonFormView(),
                isActive: $isEditing
            ) {
                EmptyView()
            }
            .hidden()
        )
    }
}

struct DetailsLivCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsLivCardView()
    }
}
