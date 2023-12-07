//
//  FormulaireView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
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
        NavigationView {
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
     
                NavigationLink(destination: DetailsLivListView(), isActive: $livraisonViewModel.isNavigationActive) {
                    EmptyView()
                }
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
    }
}

struct LivraisonFormView_Previews: PreviewProvider {
    static var previews: some View {
        LivraisonFormView(isEditing: .constant(false))
    }
}

/*
import SwiftUI

struct LivraisonFormView: View {
    @State private var nomArticle = ""
    @State private var nomClient = ""
    @State private var addressMailClient = ""
    @State private var numeroClient = ""
    @State private var selectedVille = "Tunis"
    @State private var addressClient = ""
    
    @State private var showErrorMessages = false
    @State private var isNavigationActive = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack(alignment: .center, spacing: 20) {
                    Image("Image1")
                        .resizable()
                        .frame(width: 202, height: 174)
                        .padding(.top, 16)

                    VStack(alignment: .center, spacing: 8) {
                        CustomTextField(placeholder: "Nom de l'article", text: $nomArticle, borderColor: .green)
                        CustomTextField(placeholder: "Nom du client", text: $nomClient, borderColor: .green)
                        CustomTextField(placeholder: "Adresse e-mail du client", text: $addressMailClient, borderColor: .green)
                        CustomTextField(placeholder: "Numéro du client", text: $numeroClient, borderColor: .green)
                        Picker(selection: $selectedVille, label: Text("Ville")) {
                            ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                                Text(city)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                      
                        CustomTextField(placeholder: "Adresse du client", text: $addressClient, borderColor: .green)
                    }
                    .padding(.top, 16)

                    Button(action: {
                        if validateInputs() {
                            let livraison = Livraisonn(Nom_Article: nomArticle,
                                                       Nom_Client: nomClient,
                                                       address_mail_Client: addressMailClient,
                                                       numero_Client: numeroClient,
                                                       ville: selectedVille,
                                                       address_Client: addressClient)
                            print(livraison)
                            showErrorMessages = true
                            isNavigationActive = true
                        }
                    }) {
                        Text("Enregistrer")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(15)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 10)

                    if showErrorMessages {
                        FailedText(message: "Votre livraison a été enregistrée")
                    }
                }
                .padding(.horizontal, 16)

                Spacer()
            }
            //.navigationTitle("Formulaire de Livraison")
            .background(
                NavigationLink(destination: DetailsLivListView(), isActive: $isNavigationActive) {
                    EmptyView()
                }
            )
        }
    }

    func validateInputs() -> Bool {
        // Ajoutez ici la logique de validation
        // Retournez true si tous les champs sont valides, sinon false
        return true
    }
}

struct FailedText: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.green)
            .padding(.top, 8)
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var borderColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
    }
}

struct LivraisonFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LivraisonFormView()
        }
    }
}

*/




