//
//  articledetails.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI
import URLImage

struct articledetails: View {
    @StateObject private var articleViewModel = ArticleViewModel()
        var article: article

        var body: some View {
            ZStack {
                Color(.white)
                
                VStack {
                    Spacer()
                    URLImage(article.PhotoArticle, content: { image in
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding(.bottom, 20)
                    })
                    
                    Text(article.NomArticle)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                    Text(article.DescriptionArticle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(Color(.black))
                        .padding(.bottom, 10)
                    
                    NavigationLink(destination: articlereview()) {
                        Text("Voulez-vous partager votre avis?")
                            .font(.footnote)
                            .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .padding()
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)
                    
                    Button(action: {
                    }) {
                        Text("Réserver")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color(.white))
                            .padding(10)
                            .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 100)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
            }
            .onAppear {
                articleViewModel.GetArticleById(articleId: article.id)
            }
        }
    }



#Preview {
    articledetails(article: article(id: "1", PhotoArticle: URL(string: "")!, NomArticle: "Sample", DescriptionArticle: "Lorem Ipsum", EtatArticle: "New", Categorie: "Fashion", __v: 0))
}

