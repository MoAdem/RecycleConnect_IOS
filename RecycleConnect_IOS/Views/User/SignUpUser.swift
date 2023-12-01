//
//  SignUpUser.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import SwiftUI

struct SignUpUser: View {
    @State private var isEditing: Bool = false
    
    @State private var email: String = ""
    @State private var nom: String = ""
    @State private var adress: String = ""
    @State private var tel: String = ""

    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var fullNameError: String? = nil
    @State private var emailError: String? = nil
    @State private var passwordError: String? = nil
    @State private var confirmPasswordError:String? = nil
    @State private var addressError: String? = nil
    @State private var phoneError: String? = nil

    var body: some View {
        VStack {
            HStack {
                Image("subscribe")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 170)
                    .padding(.bottom, 1)
            }
            .padding(.top,1)
            
            TextField("", text: $nom,
                      prompt: Text("Nom")
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
            if let error = fullNameError {
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

            TextField("", text: $adress,
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
            
            TextField("", text: $tel,
                      prompt: Text("Téléphone")
                
            )
            
            .disableAutocorrection(true)
            .frame(width: 300, height: 40)
            .padding(.leading, 40)
            .background(Image("phone").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 10), alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Color(Fonts.darkGreen)),
                            lineWidth: 1.5)
            )
           
            .padding(.bottom, 15)
            if let error = phoneError {
                         Text(error)
                             .foregroundColor(.red)
                             .padding(.bottom, 1)


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
            .padding(.bottom,15)
            
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
            .padding(.bottom, 10)
            
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

            if fullNameError == nil && emailError == nil && passwordError == nil && confirmPasswordError == nil && addressError == nil {
            }
        }

        private func validateInput() {
            if nom.isEmpty {
                fullNameError = "Veuillez remplir ce champ !"
            } else if nom.count < 6 {
                fullNameError = "Au moins 6 caractères!"
            } else {
                fullNameError = nil
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
            if tel.isEmpty {
                phoneError = "Veuillez remplir ce champ !"
            } else  if !(tel.hasPrefix("5") || tel.hasPrefix("9") || tel.hasPrefix("2")) {
                phoneError = "Veuillez entrer un numéro valide"
            } else if tel.count != 8 {
                phoneError = "Veuillez entrer un numéro valide"
            } else {
                phoneError = nil
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

            if adress.isEmpty {
                addressError = "Veuillez remplir ce champ !"
            } else {
                addressError = nil
            }
        }
    }



#Preview {
    SignUpUser()
}
