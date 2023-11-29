//
//  ResetPassword.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 30/11/2023.
//

import SwiftUI

struct ResetPassword: View {
    
    @State private var verificationCode: String = "";
    var body: some View {
        VStack{
            Image("")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 1)
                .padding(.top ,1)
                
            HStack{
                Text("Un code a été envoyé à l'adresse:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.bottom, 2)
            HStack{
                Text(verbatim: "bouguerra.hanine@gmail.com")
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
                .padding(.bottom, 20)
                .padding(.top , 30)
                .padding()
            HStack{
                Text("Veuillez entrer le code recu: ")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading, 35)
            TextField("", text: $verificationCode,
                      prompt: Text("Code")
                
            )
            .disableAutocorrection(true)
            .frame(width: 320, height: 60)
            .padding(.leading, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(Fonts.darkGreen),
                            lineWidth: 1.5)
            )
            .padding(.bottom, 30)
            HStack {
                Button{
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 40)
                            .foregroundColor(Fonts.darkGreen)
                        Text("Continuer")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
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
}


#Preview {
    ResetPassword()
}

