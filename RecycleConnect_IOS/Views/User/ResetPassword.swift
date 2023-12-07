//
//  ResetPassword.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 29/11/2023.
//

import SwiftUI

struct ResetPassword: View {
    
    enum ResetPasswordStatus {
        case resetting
        case resetSent
        case error
    }
    enum ViewStack {
        case UpdatePassword
    }
    @Environment(\.presentationMode) var presentationMode

       @State private var showAlert = false
       @State private var alertMessage = ""
       @State private var verificationCode: String = ""
       @State private var email: String = ""
       @State private var emailError: String? = nil
       @State private var NavigateToUpdatepassword = false
       @State private var isResetCodeSent = false
       @State private var resetPasswordStatus: ResetPasswordStatus = .resetting

       @State private var presentNextView = false
       @StateObject var userViewModel = UserViewModel()
       @State private var isCodeVerified = false
       @State private var nextView: ViewStack = .UpdatePassword

    var body: some View {
        VStack{
            Image("")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 1)
                .padding(.top ,1)
                
            HStack{
                Text("Veuillez entrer votre adresse mail")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.bottom, 2)
            HStack{
                Text("Un code vous sera envoyé! ")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundStyle(Color(Fonts.darkGreen))
                
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.bottom, 15)
            
            Image("reset")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding(.bottom, 30)
                .padding(.top , 40)
                .padding(.leading, 1)
           
            .padding(.leading, 35)
            TextField("", text: $email,
                      prompt: Text("Adresse mail")
                
            )
            .disableAutocorrection(true)
            .frame(width: 300, height: 50)
            .padding(.leading, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Fonts.darkGreen),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 30)
            if let error = emailError {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.bottom, 1)
                
            }
            
            HStack {
                Button{
                    self.resetPasswordStatus = .resetting
                    validInput()
                    sendPasswordReset()
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 40)
                            .foregroundColor(Fonts.darkGreen)
                        Text("Envoyer")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                    }
                    .alert(isPresented: $showAlert) {
                        switch resetPasswordStatus  {
                        case .resetSent:
                            return Alert(
                                title: Text("Renitialiser mot de passe"),
                                message: Text(alertMessage),
                                dismissButton: .default(
                                              Text("OK"),
                                              action: {
                                                  if isResetCodeSent {
                                                      NavigateToUpdatepassword = true
                                                  }
                                              }
                                          )
                                      )
                        case .error:
                            return Alert(
                                title: Text("Erreur"),
                                message: Text(alertMessage),
                                dismissButton: .default(
                                    Text("OK")
                                )
                            )
                        default:
                            return Alert(title: Text(""), message: Text(""), dismissButton: .default(Text("")))
                        }
                    }
                }
                .padding(.leading, 130)
                Spacer()
            }
            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(
                   NavigationLink("", destination: UpdatePassword(), isActive: $isResetCodeSent)
                       .opacity(0)
                       .buttonStyle(PlainButtonStyle())
               )
               .onChange(of: showAlert) { newShowAlert in
                   if !newShowAlert && alertMessage == "Code envoyé avec succès!" {
                       presentNextView = true
                   }
               }
               .alert(isPresented: $showAlert) {
                   Alert(
                       title: Text("Renitialiser mot de passe"),
                       message: Text(alertMessage),
                       dismissButton: .default(
                           Text("OK")
                       )
                   )
               }
           
    }
    private func sendPasswordReset() {
        guard emailError == nil && !email.isEmpty else {
            showAlert = true
            alertMessage = "Veuillez entrer une adresse email valide."
            return
        }

        userViewModel.forgotPassword(email: email) { result in
            switch result {
            case .success(let message):
                print("Password reset code sent: \(message)")
                showAlert = true
                alertMessage = "Code envoyé avec succès!"
                nextView = .UpdatePassword

            case .failure(let error):
                print("Error sending password reset code: Réessayer")
                showAlert = true
                alertMessage = "Envoi de code a échoué: Réessayer "
            }
        }
    }
    private func validInput() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        if email.isEmpty {
            emailError = "Veuillez entrer votre adresse mail !"
        } else if !emailPredicate.evaluate(with: email) {
            emailError = "Adresse email invalide"
        } else {
            emailError = nil
        }
    }
   }


#Preview {
    ResetPassword()
}

