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
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        VStack {
            HStack {
                Image("subscribe")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
            }
            .padding(.top, 50)
            
            
            TextField("", text: $email,
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
            
            .padding(.bottom, 25)

            TextField("", text: $email,
                      prompt: Text("Adresse Email ")
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
            .padding(.bottom, 25)
            
            
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
            .padding(.bottom, 25)
            
            
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
            .padding(.bottom, 25)
            
            
          
            HStack {
                Button(action: {
                    // Add your registration code here
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
   
}
#Preview {
    SignUpUser()
}
