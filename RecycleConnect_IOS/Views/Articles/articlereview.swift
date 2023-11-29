//
//  articlereview.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI

struct articlereview: View {
    
    @State private var ratingsAndComments: [(rating: Double, comment: String)] = [
            (rating: 4.5, comment: "Article conforme à la photo postée! \u{2028} Je recommande vivement cet utilisateur."),
            (rating: 3.5, comment: "Quelques problémes par rapport à la livraison. \u{2028}     Mais une bonne éxperience au finel."),
            (rating: 5.0, comment: "A recommander! \u{2028} Hâte de voir vos futurs articles. ")
        ]
        
        @State private var newRating: Double = 0
        @State private var newComment: String = ""
        
        var body: some View {
            VStack {
                ForEach(ratingsAndComments.indices) { index in
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(1..<6) { star in
                                Image(systemName: star <= Int(ratingsAndComments[index].rating) ? "star.fill" : "star")
                                    .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                                    .font(.system(size: 25))
                                    .frame(width: 30, height: 30 , alignment: .leading)
                            }
                        }
                        
                        Text(ratingsAndComments[index].comment)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, -10)
                    }
                    .padding(.bottom)
                }
                
                VStack(alignment: .leading) {
                    Text("Add a rating:")
                        .font(.headline)
                    
                    HStack {
                        ForEach(1..<6) { star in
                            Image(systemName: star <= Int(newRating) ? "star.fill" : "star")
                                .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .font(.system(size: 25))
                                .frame(width: 35, height: 35)
                                .onTapGesture {
                                    newRating = Double(star)
                                }
                        }
                    }
                    
                    TextField("Saisir un nouveau commentaire ", text: $newComment)
                        .padding(5)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: .infinity, height: 30, alignment: .leading) // Changed height here
                }
            }
            .padding()
        }
    }


#Preview {
    articlereview()
}
