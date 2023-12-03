//
//  FormulaireView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
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
/*
import SwiftUI

struct LivraisonFormView: View {
    @State private var nomArticle = ""
    @State private var nomClient = ""
    @State private var addressMailClient = ""
    @State private var numeroClient = ""
    @State private var selectedVille = "Tunis"
    @State private var addressClient = ""

    @ObservedObject var livraisonViewModel = LivraisonViewModel()

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
                        CustomTextField(placeholder: "Nom de l'article", text: $nomArticle, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Nom du client", text: $nomClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Adresse e-mail du client", text: $addressMailClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Numéro du client", text: $numeroClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        Picker(selection: $selectedVille, label: Text("Ville")) {
                            ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                                Text(city)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                      
                        CustomTextField(placeholder: "Adresse du client", text: $addressClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                    }

                    .padding(.top, 16)

                    Button(action: {
                        livraisonViewModel.sendLivraisonToServer(nomArticle: nomArticle,
                                                                  nomClient: nomClient,
                                                                  addressMailClient: addressMailClient,
                                                                  numeroClient: numeroClient,
                                                                  selectedVille: selectedVille,
                                                                  addressClient: addressClient)
                    }) {
                        Text("Enregistrer")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .cornerRadius(15)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 10)

                    if livraisonViewModel.showErrorMessages {
                        FailedText(message: "Votre livraison a été enregistrée")
                    }
                }
                .padding(.horizontal, 16)

                Spacer()
            }
            .background(
                NavigationLink(destination: DetailsLivListView(), isActive: $livraisonViewModel.isNavigationActive) {
                    EmptyView()
                }
            )
        }
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

struct FailedText: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
            .padding(.top, 8)
    }
}*/
// LivraisonFormView.swift

import SwiftUI

struct LivraisonFormView: View {
    @State private var nomArticle = ""
    @State private var nomClient = ""
    @State private var addressMailClient = ""
    @State private var numeroClient = ""
    @State private var selectedVille = "Tunis"
    @State private var addressClient = ""

    @ObservedObject var livraisonViewModel = LivraisonViewModel()

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
                        CustomTextField(placeholder: "Nom de l'article", text: $nomArticle, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Nom du client", text: $nomClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Adresse e-mail du client", text: $addressMailClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        CustomTextField(placeholder: "Numéro du client", text: $numeroClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                        Picker(selection: $selectedVille, label: Text("Ville")) {
                            ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                                Text(city)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        CustomTextField(placeholder: "Adresse du client", text: $addressClient, borderColor: Color(red: 0.05, green: 0.54, blue: 0.48))
                    }

                    .padding(.top, 16)

                    Button(action: {
                        livraisonViewModel.sendLivraisonToServer(nomArticle: nomArticle,
                                                                  nomClient: nomClient,
                                                                  addressMailClient: addressMailClient,
                                                                  numeroClient: numeroClient,
                                                                  selectedVille: selectedVille,
                                                                  addressClient: addressClient)
                    }) {
                        Text("Enregistrer")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .cornerRadius(15)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 10)

                    if livraisonViewModel.showErrorMessages {
                        FailedText(message: "Votre livraison a été enregistrée")
                    }
                }
                .padding(.horizontal, 16)

                Spacer()
            }
            .background(
                NavigationLink(destination: DetailsLivListView(), isActive: $livraisonViewModel.isNavigationActive) {
                    EmptyView()
                }
            )
        }
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

struct FailedText: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
            .padding(.top, 8)
    }
}

