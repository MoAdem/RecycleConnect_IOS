//
//  update2Password.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 12/12/2023.
//

import SwiftUI

struct Update2Password: View {
    
        @State private var isCodeVerified = false
        @State private var showAlert = false
        @State private var alertMessage = ""
        @State private var verificationCode: String = ""
        @StateObject var userViewModel = UserViewModel()
        @State private var showNewScreen = false
    var body: some View {
        VStack{
            Image("changePass")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 1)
                .padding(.top ,120)
                
          
            .padding(.leading, 4)
            .padding(.bottom, 60)
            HStack{
                Text("Entrer votre nouveau mot de passe ! ")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.bottom, 15)
            
            TextField("", text: $verificationCode,
                      prompt: Text("Nouveau mot de passe")
                
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
                Text("Confirmer votre mot de passe !")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.bottom, 15)
            
            TextField("", text: $verificationCode,
                      prompt: Text("Confirmer mot de passe")
                
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
                    validateAndVerifyCode()

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
                               Alert(title: Text("Réinitialiser mot de passe"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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
  
    private func validateAndVerifyCode() {
         if verificationCode.isEmpty {
             alertMessage = "Please enter both password and verification code."
             showAlert = true
             return
         }

         userViewModel.verifyResetCode(resetCode: verificationCode, email: "Bouguerrahanine4@gmail.com") { success in
             DispatchQueue.main.async {
                 if success {
                     isCodeVerified = true
                     alertMessage = "Code verified.Now you can change your password ! "
                     showAlert = true
                     showNewScreen = true
                 } else {
                     alertMessage = "Incorrect verification code."
                     showAlert = true
                 }
             }
         }
     }
 }

#Preview {
    Update2Password()
}
