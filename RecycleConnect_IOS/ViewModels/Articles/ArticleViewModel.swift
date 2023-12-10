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




    func GetAllArticles() {
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


    
    func CreateArticle(completion: @escaping (Result<article, ArticleServices.NetworkError>) -> Void) {
            guard let photoData = PhotoArticleData else {
                completion(.failure(.photoNotProvided))
                return
            }


            ArticleServices.shared.CreateArticle(
                //id: id,
                NomArticle: NomArticle,
                DescriptionArticle: DescriptionArticle,
                EtatArticle: EtatArticle,
                CategorieId: Categorie,
                PhotoArticleData: photoData
            ) { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    
}


