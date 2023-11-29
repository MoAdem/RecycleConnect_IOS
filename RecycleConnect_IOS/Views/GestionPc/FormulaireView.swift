//
//  FormulaireView.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import SwiftUI

struct Livraison: Identifiable {
    var id = UUID()
    var fullName: String
    var email: String
    var phoneNumber: String
    var selectedCity: String
    var address: String
}

struct FormulaireView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var selectedCityIndex = 0
    @State private var address = ""
    @State private var isConfirmationVisible = false

    let cities = ["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"]
    @State private var livraisons: [Livraison] = []

    var body: some View {
        VStack {
            Image("Image1")
                .resizable()
                .frame(width: 202, height: 174)
                .padding(.top, 16)

            VStackTextField(placeholder: "Nom complet", text: $fullName)
            VStackTextField(placeholder: "E-mail", text: $email)
            VStackTextField(placeholder: "Numéro de téléphone", text: $phoneNumber)
            VStackPicker(selection: $selectedCityIndex, options: cities, label: "Ville")
            VStackTextField(placeholder: "Adresse", text: $address)

            Button(action: {
                let newLivraison = Livraison(
                    fullName: fullName,
                    email: email,
                    phoneNumber: phoneNumber,
                    selectedCity: cities[selectedCityIndex],
                    address: address
                )
                livraisons.append(newLivraison)
                self.isConfirmationVisible.toggle()
            }) {
                Text("Soumettre")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding(.top, 16)

            Text("Votre livraison a été enregistrée")
                .padding(.bottom, 45)
                .foregroundColor(.green)
                .opacity(isConfirmationVisible ? 1.0 : 0.0)
                .animation(.easeInOut)
        }
        .padding()
    }
}

struct VStackTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 353, height: 51)
                .overlay(
                    TextField(placeholder, text: $text)
                        .padding()
                )
                Spacer()
        }
    }
}

struct VStackPicker: View {
    @Binding var selection: Int
    var options: [String]
    var label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Picker(label, selection: $selection) {
                ForEach(0..<options.count) {
                    Text(self.options[$0])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding([.leading, .trailing], 10)
            .padding(.top, 8)
            Spacer()
        }
    }
}

struct FormulaireView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaireView()
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

    @State private var showErrorMessages = false

    var body: some View {
        VStack {
            Spacer()

            VStack(alignment: .center, spacing: 20) {
                Image("Image1")
                    .resizable()
                    .frame(width: 202, height: 174)
                    .padding(.top, 16)

                VStack(alignment: .leading, spacing: 8) {
                    CustomTextField(placeholder: "Nom de l'article", text: $nomArticle)
                    CustomTextField(placeholder: "Nom du client", text: $nomClient)
                    CustomTextField(placeholder: "Adresse e-mail du client", text: $addressMailClient)
                    CustomTextField(placeholder: "Numéro du client", text: $numeroClient)

                    Picker("Ville", selection: $selectedVille) {
                        ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                            Text(city)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    CustomTextField(placeholder: "Adresse du client", text: $addressClient)
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
                    }
                }) {
                    Text("Enregistrer la livraison")
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
        .navigationTitle("Formulaire de Livraison")
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

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
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

                    VStack(alignment: .leading, spacing: 8) {
                        CustomTextField(placeholder: "Nom de l'article", text: $nomArticle)
                        CustomTextField(placeholder: "Nom du client", text: $nomClient)
                        CustomTextField(placeholder: "Adresse e-mail du client", text: $addressMailClient)
                        CustomTextField(placeholder: "Numéro du client", text: $numeroClient)

                        Picker("Ville", selection: $selectedVille) {
                            ForEach(["Tunis", "Nabeul", "Gafsa", "Sfax", "Sousse"], id: \.self) { city in
                                Text(city)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        CustomTextField(placeholder: "Adresse du client", text: $addressClient)
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
                        Text("Enregistrer la livraison")
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
            .navigationTitle("Formulaire de Livraison")
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

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
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


