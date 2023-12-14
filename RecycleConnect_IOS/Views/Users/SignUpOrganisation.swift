//
//  SignUpOrganisation.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 30/11/2023.
//

import SwiftUI


struct SignUpOrganisation: View {
    @State private var isEditing: Bool = false
    @StateObject var userViewModel = UserViewModel()
    @State private var shouldNavigateToSignIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var email: String = ""
    @State private var nom: String = ""
    @State private var adresse: String = ""
    @State private var description: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    // controle de saisie
    
    @State private var NomError: String? = nil
    @State private var emailError: String? = nil
    @State private var addressError: String? = nil
    @State private var passwordError: String? = nil
    @State private var confirmPasswordError:String? = nil
    @State private var descriptionError: String? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image("subscribe")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 170)
                    .padding(.bottom, 10)
            }
            .padding(.top, 10)
            
            
            TextField("", text: $nom,
                      prompt: Text("Nom d'organisation")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("profile").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            
            .padding(.bottom, 20)
            
            TextField("", text: $email,
                      prompt: Text("Adresse mail ")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("email").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 20)

            TextField("", text: $adresse,
                      prompt: Text("Adresse ")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("location").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 20)
        
            TextField("", text: $description,
                      prompt: Text("Description ")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("desc").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 20)
           
            SecureField("", text: $password,
                        prompt: Text("Mot de passe")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("lock").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 20)
            
            SecureField("", text: $confirmPassword,
                        prompt: Text("Confirmer mot de passe ")
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("lock").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 20)
          
            HStack {
                Button(action: {
                    validateAndSignUp()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 40)
                            .foregroundColor(Color(Fonts.darkGreen))
                        Text("Continuer")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                    }
                }
                .padding(.leading, 120)
                Spacer()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(shouldNavigateToSignIn ? "Succès" : "Erreur"),
                        message: Text(alertMessage),
                        dismissButton: .default(
                            Text("OK"),
                            action: {
                                if shouldNavigateToSignIn {
                                    shouldNavigateToSignIn = false
                                    shouldNavigateToSignIn = true
                                }
                            }
                        )
                    )
                }
            }
            .background(
                NavigationLink("", destination: SignInView(), isActive: $shouldNavigateToSignIn)
                    .opacity(0)
                    .buttonStyle(PlainButtonStyle())
            )
        }}
    
    private func validateAndSignUp() {
        validateInput()
        if NomError == nil && emailError == nil && passwordError == nil && confirmPasswordError == nil && addressError == nil && descriptionError == nil {
            userViewModel.createOrg(username: nom, email: email, address: adresse, telephone: "55658945", password: password, role: "organization", orgDescription: description)
               { result in
                switch result {
                case .success(let successMessage):
                    print("Success: \(successMessage)")
                    showAlert(message: "Création du compte est effectuée !")
                    shouldNavigateToSignIn = true
                case .failure(let errorMessage):
                    print("Error: \(errorMessage)")
                    showAlert(message: "Création du compte échouée !")
                    shouldNavigateToSignIn = false
                }
            }
        } else {
            shouldNavigateToSignIn = false
        }
    }
    private func validateInput() {
        var errors: [String] = []
        
        if nom.isEmpty {
            NomError = "Le nom ne peut pas être vide"
            showAlert = true
            alertMessage = NomError!
               return
        } else if nom.count < 6 {
            NomError = "Au moins 6 caractères!"
            showAlert = true
            alertMessage = NomError!
        } else {
            NomError = nil
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if email.isEmpty {
            emailError = "Veuillez entrer votre adresse mail !"
            showAlert = true
            alertMessage = emailError!
        } else if !emailPredicate.evaluate(with: email) {
            emailError = "Adresse email invalide"
            showAlert = true
            alertMessage = emailError!
        } else {
            emailError = nil
        }
        
        if password.isEmpty {
            passwordError = "Veuillez entrer votre mot de passe!"
            showAlert = true
            alertMessage = passwordError!
           
        } else {
            passwordError = nil
        }
        if description.isEmpty {
            descriptionError = "Veuillez entrer une descritpion de l'organisation!"
            showAlert = true
            alertMessage = descriptionError!
           
        } else {
            passwordError = nil
        }
        if confirmPassword.isEmpty {
            confirmPasswordError = "Veuillez confirmer votre mot de passe!"
            showAlert = true
            alertMessage = confirmPasswordError!
          
        } else if password != confirmPassword {
            confirmPasswordError = "Les mots de passe sont incompatibles!"
            showAlert = true
            alertMessage = confirmPasswordError!
          
        } else {
            confirmPasswordError = nil
        }
        
        if adresse.isEmpty {
            addressError = "Veuillez entrer votre adresse !"
            showAlert = true
            alertMessage = addressError!
        } else {
            addressError = nil
        }
        
        for error in errors {
            showAlert(message: error)
        }
    }

    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
    
    
}

#Preview {
    SignUpOrganisation()
}

