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

    init(id : String, PhotoCategorie: URL, NomCategorie: String, NbreTotalArticles: Int, __v : Int) {
            self.id = id
            self.PhotoCategorie = PhotoCategorie
            self.NomCategorie = NomCategorie
            self.NbreTotalArticles = NbreTotalArticles
            self.__v = __v
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        PhotoCategorie = try container.decode(URL.self, forKey: .PhotoCategorie)
        NomCategorie = try container.decode(String.self, forKey: .NomCategorie)
        NbreTotalArticles = try container.decode(Int.self, forKey: .NbreTotalArticles)
        __v = try container.decode(Int.self, forKey: .__v)
    }

}
