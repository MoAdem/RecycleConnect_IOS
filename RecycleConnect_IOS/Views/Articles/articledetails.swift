//
//  articledetails.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI

struct articledetails: View {
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
                    .font(.title)
                   .fontWeight(.bold)
                   .padding(.bottom, 20)
                
                Text("Sac à mains authentique. \u{2028} Porté uniquement 2 fois. \u{2028} Il est en trés bon état.")
                    .font(.title3)
                    .font(.subheadline)
                    .foregroundColor(Color(.black))
                    .padding(.bottom, 50)
                
                Button(action: {
                }) {
                    Text("Réserver")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                        .padding()
                        .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .cornerRadius(10)
                }
                .padding(.bottom, 100)
            }
        }
    }

}


#Preview {
    articledetails()
}
