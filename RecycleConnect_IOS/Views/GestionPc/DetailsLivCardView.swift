//
//  DetailsLivCardView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
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
    @ObservedObject var livraisonViewModel: LivraisonViewModel
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
                livraisonViewModel.deleteLivraisonFromServer(id: livraison.id)
                // Optionally, update the UI or perform any other actions after deletion
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
/*
import SwiftUI

struct DeleteConfirmationView: View {
    let title: String
    let message: String
    @Binding var isPresented: Bool
    var onConfirm: () -> Void

    var body: some View {
        if isPresented {
            VStack {
                Text(title)
                    .font(.title)
                    .padding()

                Text(message)
                    .padding()

                HStack {
                    Button("Annuler") {
                        isPresented = false
                    }
                    .padding()

                    Button("Supprimer") {
                        onConfirm()
                        isPresented = false
                    }
                    .foregroundColor(.red)
                    .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding()
        }
    }
}

struct DetailsLivCardView: View {
    var livraison: Livraisonn
    @ObservedObject var livraisonViewModel: LivraisonViewModel
    @State private var isEditing = false
    @State private var showDeleteConfirmation = false

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
                showDeleteConfirmation = true
            }
            .tint(.red)

            Button("Modifier") {
                isEditing.toggle()
            }
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
        }
        .background(
            DeleteConfirmationView(
                title: "Confirmer la suppression",
                message: "Êtes-vous sûr de vouloir supprimer cette livraison ?",
                isPresented: $showDeleteConfirmation,
                onConfirm: {
                    // Action de suppression (appelez la méthode de suppression ici)
                    livraisonViewModel.deleteLivraisonFromServer(id: livraison.id)
                }
            )
        )
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
import SwiftUI

struct DetailsLivCardView: View {
    var livraison: Livraisonn
    @ObservedObject var livraisonViewModel: LivraisonViewModel
    @State private var isEditing = false
    @State private var showDeleteConfirmation = false
    struct DeleteConfirmationView: View {
        let title: String
        let message: String
        @Binding var isPresented: Bool
        var onConfirm: () -> Void

        var body: some View {
            if isPresented {
                VStack {
                    Text(title)
                        .font(.title)
                        .padding()

                    Text(message)
                        .padding()

                    HStack {
                        Button("Annuler") {
                            isPresented = false
                        }
                        .padding()

                        Button("Supprimer") {
                            onConfirm()
                            isPresented = false
                        }
                        .foregroundColor(.red)
                        .padding()
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 4)
                .padding()
            }
        }
    }

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
                showDeleteConfirmation = true
            }
            .tint(.red)

            Button("Modifier") {
                isEditing.toggle()
            }
            .tint(Color(red: 0.05, green: 0.54, blue: 0.48))
        }
        .background(
            DeleteConfirmationView(
                title: "Confirmer la suppression",
                message: "Êtes-vous sûr de vouloir supprimer cette livraison ?",
                isPresented: $showDeleteConfirmation,
                onConfirm: {
                    // Action de suppression (appelez la méthode de suppression ici)
                    livraisonViewModel.deleteLivraisonFromServer(id: livraison.id)
                }
            )
        )
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

