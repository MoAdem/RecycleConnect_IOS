//
//  FormulaireView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI


struct LivraisonFormView: View {
    @State private var nomArticle: String
    @State private var nomClient: String
    @State private var addressMailClient: String
    @State private var numeroClient: String
    @State private var selectedVille: String
    @State private var addressClient: String

    @ObservedObject var livraisonViewModel: LivraisonViewModel
    var livraison: Livraisonn?
    @Binding var isEditing: Bool

    init(livraison: Livraisonn? = nil, isEditing: Binding<Bool>) {
        self.livraison = livraison
        self._nomArticle = State(initialValue: livraison?.Nom_Article ?? "")
        self._nomClient = State(initialValue: livraison?.Nom_Client ?? "")
        self._addressMailClient = State(initialValue: livraison?.address_mail_Client ?? "")
        self._numeroClient = State(initialValue: String(livraison?.numero_Client ?? 0))
        self._selectedVille = State(initialValue: livraison?.ville ?? "")
        self._addressClient = State(initialValue: livraison?.address_Client ?? "")
        self._isEditing = isEditing
        self.livraisonViewModel = LivraisonViewModel()
    }

    var body: some View {
       // NavigationView {
            VStack {
                Spacer()

                VStack(alignment: .center, spacing: 20) {
                    Image("Image1")
                        .resizable()
                        .frame(width: 202, height: 174)
                        .padding(.top, 16)

                    
                    TextField("Nom de l'article", text: $nomArticle)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
                        )

                    TextField("Nom du client", text: $nomClient)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
                        )

                    TextField("Adresse e-mail du client", text: $addressMailClient)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
                        )

                    TextField("Numéro du client", text: $numeroClient)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
                        )

                    Picker(selection: $selectedVille, label: Text("Ville")) {
                        ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                            Text(city)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    TextField("Adresse du client", text: $addressClient)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2)
                        )

                    Button(action: {
                        if let livraison = livraison {
                            // Perform update
                            livraisonViewModel.updateLivraisonOnServer(
                                livraisonID: livraison.id,
                                nomArticle: nomArticle,
                                nomClient: nomClient,
                                addressMailClient: addressMailClient,
                                numeroClient: numeroClient,
                                selectedVille: selectedVille,
                                addressClient: addressClient
                            )
                        } else {
                            // Perform save
                            livraisonViewModel.sendLivraisonToServer(
                                nomArticle: nomArticle,
                                nomClient: nomClient,
                                addressMailClient: addressMailClient,
                                numeroClient: numeroClient,
                                selectedVille: selectedVille,
                                addressClient: addressClient
                            )
                        }

                        // Dismiss the view
                        isEditing = false
                    }) {
                        Text("Enregistrer")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .cornerRadius(15)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 10)

                    // ... Your existing UI components ...
                }
                .padding(.horizontal, 16)

                Spacer()
            }
            .background(
     
                NavigationLink(destination: DetailsLivListView(), isActive: $livraisonViewModel.isNavigationActive ,
                    label: {
                    //EmptyView()
                }).hidden()
            )
            
            /*.navigationBarTitle("Livraison Details", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    isEditing = false
                }) {
                    Text("Annuler")
                }
            )*/
        }
    //}
}
