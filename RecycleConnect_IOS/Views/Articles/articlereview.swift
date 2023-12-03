//
//  articlereview.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI

struct articlereview: View {
    
      @State private var ratingsAndComments: [(rating: Double, comment: String)] = [
              (rating: 4.5, comment: "Article conforme à la photo postée! \u{2028}Je recommande vivement cet utilisateur."),
              (rating: 3.5, comment: "Quelques problémes par rapport à la livraison. \u{2028}Mais une bonne épocadeau finel."),
              (rating: 5.0, comment: "A recommander! \u{2028}Hâte de voir vos futurs articles. ")
          ]
          
      @State private var newRating: Double = 0
      @State private var newComment: String = "Saisir un nouveau commentaire"
      
      var body: some View {
          VStack {
              VStack(alignment: .leading) {
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
                              .padding(.leading, 5)
                      }
                      .padding(.bottom)
                  }
              }
              .padding(.top , -80)
              .frame(maxWidth: .infinity, alignment: .leading)
              
              VStack(alignment: .leading) {
                  Text("Votre Avis :")
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
                  
                  TextEditor(text: $newComment)
                      .padding(5)
                     // .background(Color(.systemGray6))
                      .cornerRadius(8)
                      .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 200, alignment: .leading)
                      /*.onAppear {
                                  if newComment == "Saisir un nouveau commentaire" {
                                      newComment = ""
                                  }
                              }
                              .onChange(of: newComment) { newValue in
                                  if newValue.isEmpty {
                                      newComment = "Saisir un nouveau commentaire"
                                  }
                              }*/
              }
          }
          .padding()
      }
  }

#Preview {
    articlereview()
}
