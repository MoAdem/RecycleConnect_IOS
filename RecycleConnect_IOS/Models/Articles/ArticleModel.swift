//
//  ArticleModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation

struct article : Identifiable, Codable , Equatable
//, Hashable
{
    var id : String
    var PhotoArticle : URL
    var NomArticle : String
    var DescriptionArticle : String
    var EtatArticle : String
    var Categorie : categorie
    var __v : Int
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case PhotoArticle, NomArticle, DescriptionArticle,EtatArticle, Categorie,  __v
        }
}
