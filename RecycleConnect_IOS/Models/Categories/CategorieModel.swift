//
//  CategorieModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation


struct categorie : Identifiable, Codable //Decodable,Hashable,
{
    
    var id : String
    var PhotoCategorie : URL
    var NomCategorie : String
    var NbreTotalArticles : Int
    var __v : Int
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case PhotoCategorie, NomCategorie, NbreTotalArticles, __v
        }

}
