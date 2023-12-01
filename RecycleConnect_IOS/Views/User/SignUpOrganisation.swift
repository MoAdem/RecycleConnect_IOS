//
//  SignUpUser.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import SwiftUI

struct SignUpOrganisation: View {
    @State private var isEditing: Bool = false
    @StateObject var userViewModel = UserViewModel()

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
           // .padding(.bottom, 25)
            
            .padding(.bottom, 15)
            if let error = NomError {
                           Text(error)
                               .foregroundColor(.red)
                               .padding(.bottom, 1)

                       }
            
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
            .padding(.bottom, 15)
            if let error = emailError {
                         Text(error)
                             .foregroundColor(.red)
                             .padding(.bottom, 1)

                     }

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
            .padding(.bottom, 15)
            if let error = addressError {
                         Text(error)
                             .foregroundColor(.red)
                             .padding(.bottom, 1)

                     }
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
            .padding(.bottom, 15)
            if let error = descriptionError {
                         Text(error)
                             .foregroundColor(.red)

                     }
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
            .padding(.bottom, 15)
            if let error = passwordError {
                         Text(error)
                             .foregroundColor(.red)
                             
                     }
            
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
            .padding(.bottom, 15)
            
            if let error = confirmPasswordError {
                         Text(error)
                             .foregroundColor(.red)
                             .padding(.bottom, 1)

                     }
          
            HStack {
                Button(action: {
                    validateAndSignUp ()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 40)
                            .foregroundColor(Color(Fonts.darkGreen))
                        Text("Continuer")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                    }
                })
                .padding(.leading, 120)
                Spacer()
            }
            Spacer()
            
        }
        
    }
    private func validateAndSignUp() {
            validateInput()

        if NomError == nil && emailError == nil && passwordError == nil && confirmPasswordError == nil && addressError == nil {
            userViewModel.createOrg(username: nom, email: email, address: adresse, telephone: "55658945", password: password, role: "organization", orgDescription: description){ result in
                switch result {
                case .success(let message):
                    print("Success: \(message)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

        private func validateInput() {
            if nom.isEmpty {
                NomError = "Veuillez remplir ce champ !"
            } else if nom.count < 6 {
                NomError = "Au moins 6 caractères!"
            } else {
                NomError = nil
            }

            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            if email.isEmpty {
                emailError = "Veuillez remplir ce champ !"
            } else if !emailPredicate.evaluate(with: email) {
                emailError = "Adresse email invalide"
            } else {
                emailError = nil
            }
           
            if password.isEmpty {
                passwordError = "Veuillez remplir ce champ !"
            } else {
                passwordError = nil
            }

            if confirmPassword.isEmpty {
                confirmPasswordError = "Veuillez remplir ce champ !"
            } else if password != confirmPassword {
                confirmPasswordError = "Les mots de passe sont incompatibles"
            } else {
                confirmPasswordError = nil
            }

            if adresse.isEmpty {
                addressError = "Veuillez remplir ce champ !"
            } else {
                addressError = nil
            }
            if description.isEmpty {
                descriptionError = "Veuillez remplir ce champ !"
            } else {
                descriptionError = nil
            }
        }
    }


#Preview {
    SignUpOrganisation()
}
