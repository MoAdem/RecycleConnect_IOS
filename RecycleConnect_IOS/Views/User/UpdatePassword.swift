//
//  ResetPassword.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 29/11/2023.
//

import SwiftUI

struct UpdatePassword: View {
       @State private var showAlert = false
       @State private var alertMessage = ""
       @State private var verificationCode: String = ""
       @State private var password: String = ""
       @State private var passwordError: String? = nil
      @State private var code: String = ""


       @StateObject var userViewModel = UserViewModel()
       @State private var isCodeVerified = false
    var body: some View {
        VStack{
            Image("changePass")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 1)
                .padding(.top ,100)
                
          
            .padding(.leading, 4)
            .padding(.bottom, 50)
            HStack{
                Text("Veuillez entrer le code d'abord ! ")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.bottom, 15)
            
            TextField("", text: $password,
                      prompt: Text("*  *  *  *  *  *  *  *")
                
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
            HStack{
                Text("Entrer votre nouveau mot de passe")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
        
                    .font(.system(size: 20))
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.bottom, 15)
            TextField("", text: $code,
                      prompt: Text("Mot de passe")
                
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
            
            HStack {
                Button{
                    validInput()

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
                               Alert(title: Text("Renitialiser mot de passe"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                           }
                }
                .padding(.leading, 130)
                Spacer()
            }
            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
  
    private func validInput() {
        if password.isEmpty {
            passwordError = "Veuillez entrer votre mot de passe !"
        } else {
            passwordError = nil
        }

    }
   }



#Preview {
    UpdatePassword()
}
