//
//  articledetails.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI

struct articledetails: View {
    
    @State private var isNavViewPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack {
                Spacer()
                
                Image("bag")
                    .resizable()
                    //.aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 20)
                
                Text("Sac à mains CK ")
                    .font(.title2)
                   .fontWeight(.bold)
                   .padding(.bottom, 20)
                
                Text("Sac à mains authentique. \u{2028} Porté uniquement 2 fois. \u{2028} Il est en trés bon état.")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color(.black))
                    .padding(.bottom, 10)
                
                NavigationLink(destination: articlereview()){
                    Text("Voulez vous partager votre avis ?")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .padding()
                        .cornerRadius(10)
                }.padding(.bottom , 10)
                    .padding(.top , -30)
                
                Button(action: {
                    isNavViewPresented.toggle()
                }) {
                    Text("Réserver")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.white))
                        .padding(10)
                        .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .cornerRadius(10)
                } .sheet(isPresented: $isNavViewPresented) {
                    NavView()
                }
                .padding(.bottom, 100)
                .padding(.leading , 10)
                .padding(.trailing , 10)
            }
        }
    }

}


#Preview {
    articledetails()
}
