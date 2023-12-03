//
//  ArticleModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation

struct article : Decodable, Identifiable
//, Hashable
{
    var id : String
    var PhotoArticle : String
    var NomArticle : String
    var DescriptionArticle : String
    var EtatArticle : String
    var Categorie : categorie
}
