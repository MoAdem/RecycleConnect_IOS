//
//  ArticleViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation
import SwiftUI

class ArticleViewModel: ObservableObject {
    @Published var articles: [article] = []
    @Published var article: article?
    
    @Published var id: String = ""
        @Published var NomArticle: String = ""
        @Published var DescriptionArticle: String = ""
        @Published var EtatArticle: String = ""
        @Published var Categorie: String = ""
        @Published var PhotoArticleData: Data?
        @Published var searchQuery: String = ""
       @Published var searchArticles: [article] = []
       @Published var sortedArticles: [article] = []





    func GetAllArticles() {
        ArticleServices.shared.GetAllArticles{ result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    print("article vm", articles)
                }
            case .failure(let error):
                print("Error fetching articles: \(error.localizedDescription)")
            }
        }
    }

    
    func GetArticleById(articleId: String) {
            ArticleServices.shared.GetArticleById(articleId: articleId) { result in
                switch result {
                case .success(let fetchedArticle):
                    DispatchQueue.main.async {
                        self.article = fetchedArticle
                    }
                case .failure(let error):
                    print("Failed to fetch article details: \(error)")
                }
            }
        }
    
    
    func DeleteArticle(articleId: String) {
        ArticleServices.shared.DeleteArticle(articleId: articleId) { result in
                switch result {
                case .success:
                    print("article supprimé")
                case .failure(let error):
                   print("erreur de suppression: \(error)")
                }
            }
        }


    
    func CreateArticle() {
            guard let photoData = PhotoArticleData else {
                print("No photo selected")
                return
            }

            ArticleServices.CreateArticle(
                NomArticle: NomArticle,
                DescriptionArticle: DescriptionArticle,
                EtatArticle: EtatArticle,
                Categorie: Categorie,
                PhotoArticle: photoData
            ) { result in
                switch result {
                case .success(let article):
                    print("Article created: \(article)")
                case .failure(let error):
                    print("Error creating article: \(error)")
                }
            }
        }
    
    
    
    /*func UpdateArticle(articleId: String) {
            guard let photoData = PhotoArticleData else {
                print("No photo selected")
                return
            }

            ArticleServices.UpdateArticle(
                articleId: articleId,
                NomArticle: NomArticle,
                DescriptionArticle: DescriptionArticle,
                EtatArticle: EtatArticle,
                Categorie: Categorie,
                PhotoArticle: photoData
            ) { result in
                switch result {
                case .success(let article):
                    print("Article created: \(article)")
                case .failure(let error):
                    print("Error creating article: \(error)")
                }
            }
        }*/
    
    /*func SearchArticleByNom() {
           /* if searchQuery.isEmpty {
                ArticleServices.shared.GetAllArticles{ result in
                    switch result {
                    case .success(let articles):
                        DispatchQueue.main.async {
                            self.articles = articles
                        }
                    case .failure(let error):
                        print("Error fetching articles: \(error.localizedDescription)")
                    }
                }
            } else {*/
                ArticleServices.shared.searchArticleByNom(nomArticle: searchQuery) { result in
                    switch result {
                    case .success(let articles):
                        DispatchQueue.main.async {
                            self.searchArticles = articles
                            print("searched vm", articles)
                        }
                    case .failure(let error):
                        print("Error searching articles: \(error)")
                    }
                }
       //     }
        }*/




       func SortArticles() {
           ArticleServices.shared.SortArticlesByNomAsc { result in
               switch result {
               case .success(let articles):
                   DispatchQueue.main.async {
                       self.sortedArticles = articles
                   }
               case .failure(let error):
                   print("Error sorting articles: \(error)")
               }
           }
       }

    

    
}

