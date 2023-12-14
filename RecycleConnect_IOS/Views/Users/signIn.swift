//
//  signIn.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 30/11/2023.
//

import SwiftUI

enum ViewStack {
    case ResetPassword
    case SignUp
    case Home
}

struct SignInView: View {
    @StateObject var userViewModel = UserViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showHomePage = false

    /// controle de saisie
    @State private var fullNameError: String? = nil
    @State private var passwordError: String? = nil

    @State private var presentNextView = false
    @State private var nextView: ViewStack = .SignUp
    @State private var isAppTabViewPresented: Bool = false
    @State private var isResetPasswordPresented: Bool = false
    
    var body: some View {
        VStack {
            Image("login")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 50)
                .padding(.top ,100)
            TextField("", text: $username, prompt: Text("Nom").foregroundColor(Color.gray))
                .disableAutocorrection(true)
                .frame(width: 300, height: 40)
                .padding(.leading, 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom,20)
                .padding(.top, 20)
                .background(Image("profile").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 30), alignment: .leading)
        

            SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(Color.gray))
                .disableAutocorrection(true)
                .frame(width: 300, height: 40)
                .padding(.leading, 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
            
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom,20)
                .padding(.top, 20)
                .background(Image("pass").resizable().scaledToFit().frame(
                    width: 25, height:40).padding(.leading, 30), alignment: .leading)
                .padding(.bottom,18)
        
            Button(action: {
                validInput()
                userViewModel.loginUser(username: username, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("Login successful for user: \(user)")
                        presentNextView = true
                        nextView = .Home
                    case .failure(let error):
                        alertMessage = "Veuillez entrer vos coordonnées "
                        showAlert = true
                        print("Login failed with error: \(error)")
                       
                    }
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 340, height: 40)
                        .foregroundColor(Fonts.darkGreen)
                    Text("Se connecter")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Login "), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                        if alertMessage == "Login successful" {
                            presentNextView = true
                        }
                    }));
                       }
                   }
            }
            .padding(.bottom, 30)
                                           
                      HStack(alignment: .center) {
                          Text("Pas de compte ?")
                              .foregroundColor(Color.black)
                              .fontWeight(.regular)
                              .font(.system(size: 18))
                          
                          Button(action: {
                                             nextView = .SignUp
                                             presentNextView = true
                                         }) {
                                             Text("Créer un compte")
                                                 .foregroundColor(Color(Fonts.darkGreen))
                                                 .fontWeight(.semibold)
                                                 .font(.system(size: 18))
                                         }
                                     }
                                     .padding(.bottom,1)
                                    Button(action: {
                                                isResetPasswordPresented.toggle()
                                               }) {
                                             Text("Mot de passe oublié ?")
                                            .foregroundColor(Color(Fonts.darkGreen))
                                            .fontWeight(.semibold)
                                            .font(.system(size: 18))
                                                                               
                                               }.sheet(isPresented: $isResetPasswordPresented) {
                                                                                     ResetPassword()
                                                                                   Spacer()
                                                                               }
                                                                               .background(Color.white)
                                                                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                                               .ignoresSafeArea()
                                                                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                                               .fullScreenCover(isPresented: $presentNextView) {
                                                                                   if nextView == .SignUp {
                                                                                       SignUpView()
                                                                                   }else if nextView == .ResetPassword {
                                                                                       ResetPassword()
                                                                                   }
                                                                                   else if nextView == .Home {
                                                                                                   AppTabView()
                                                                                          }
                                                                               }
                                                                           }
    private func validInput() {
        if username.isEmpty {
            fullNameError = "Le nom ne peut pas être vide"
            showAlert = true
            alertMessage = fullNameError!
               return
        } else if username.count < 6 {
            fullNameError = "Au moins 6 caractères!"
            showAlert = true
            alertMessage = fullNameError!
        } else {
            fullNameError = nil
        }
        
        if password.isEmpty {
            passwordError = "Veuillez entrer votre mot de passe!"
            showAlert = true
            alertMessage = passwordError!
           
        } else {
            passwordError = nil
        }
        
    }
                                                                       }

                                              #Preview {
                                                  SignInView()
                                              }
