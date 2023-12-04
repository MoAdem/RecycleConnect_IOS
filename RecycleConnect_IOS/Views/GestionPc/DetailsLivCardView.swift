//
//  DetailsLivCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
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
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.Nom_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_mail_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("\(livraison.numero_Client)")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_Client)
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
            Button("Supprimer", systemImage: "trash") {
                // Action de suppression
                viewModel.deleteLivraisonFromServer(livraisonID: livraison.id)
            }
            .tint(.red)

            Button("Modifier", systemImage: "pencil") {
                isEditing.toggle()
            }
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
        }
        .background(
            NavigationLink(
                destination: LivraisonFormView(livraison: livraison, isEditing: $isEditing),
                isActive: $isEditing
            ) {
                EmptyView()
            }
            .hidden()
        )
    }
}

/*
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
}*/
/*
import SwiftUI
struct DetailsLivCardView: View {
    var livraison: Livraisonn

    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée avec succès sous les coordonnées  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.Nom_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_mail_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("\(livraison.numero_Client)")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_Client)
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
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
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
*/
// DetailsLivCardView.swift

// DetailsLivCardView.swift

// DetailsLivCardView.swift

// DetailsLivCardView.swift





/*
import SwiftUI

struct DetailsLivCardView: View {
    var livraison: Livraisonn
    @ObservedObject var viewModel: LivraisonViewModel  // Assurez-vous que cette ligne est présente

    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 7) {
            VStack(alignment: .leading, spacing: 9) {
                Text("Votre commande a été ajoutée avec succès sous les coordonnées  ")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.Nom_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_mail_Client)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("\(livraison.numero_Client)")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(livraison.address_Client)
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
            Button("Supprimer", systemImage: "trash") {
                // Action de suppression
                viewModel.deleteLivraisonFromServer(livraisonID: livraison.id)
            }
            .tint(.red)

            Button("Modifier", systemImage: "pencil") {
                isEditing.toggle()
            }
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
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
}*/
        /*.overlay(
            HStack(spacing: 20) {
                Button(action: {
                    viewModel.deleteLivraisonFromServer(livraisonID: livraison.id)

                }) {
                    Label("Supprimer", systemImage: "trash")
                        .foregroundColor(.red)
                }

                Button(action: {
                    isEditing.toggle()
                }) {
                    Label("Modifier", systemImage: "pencil")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            , alignment: .bottom
        )
    }
}
*/
