//
//  ArticleViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [article] = []
    @Published var article: article?

    func GetAllArticles() {
        ArticleServices.shared.GetAllArticles{ result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    print("voici la liste des articles viewmodel",articles)
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


    
    
    
   /* func createCategorie(NomCategorie: String, NbreTotalArticles: Int) {
        CategorieServices.shared.CreateCategorie(NomCategorie: NomCategorie, NbreTotalArticles: NbreTotalArticles) { result in
            switch result {
            case .success(let nouvCategorie):
                print("New category created: \(nouvCategorie)")
                // You may want to update the list of categories after creating a new one
                self.GetAllCategories()
            case .failure(let error):
                print("Error creating category: \(error.localizedDescription)")
            }
        }
    }*/
}


