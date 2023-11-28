//
//  signIn.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

//
//  SignInView.swift
//  Ecocircuit
//
//  Created by Ibrahim saddour on 8/11/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
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
                .padding(.leading, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
                .padding(.bottom,20)
                .padding(.top, 20)
            
            SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(Color.gray))
                .disableAutocorrection(true)
                .frame(width: 300, height: 40)
                .padding(.leading, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
                .padding(.bottom, 30)
            
            Button{
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 320, height: 40)
                        .foregroundColor(Fonts.darkGreen)
                    Text("Se connecter")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                }
            }
            .padding(.bottom, 15)
            
            // Sign up button
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content:
                    {
                Text("Pas du compte ?")
                    .foregroundStyle(Color.black)
                    .fontWeight(.regular)
                    .font(.system(size: 18))
                Button{
                    // Perform sign up navigation here
                } label: {
                    Text("Créer un compte")
                        .foregroundStyle(Color(Fonts.darkGreen))
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                }
                
            })
            .padding(.bottom, 12)
            
            Spacer()
            
            ZStack{
                Image("loginBackgroundBottom")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 400, height: 200)
            .offset(y: -20)
            
        }
        .background(.white)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
#Preview {
    SignInView()
}

