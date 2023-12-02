//
//  CategorieModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation


struct categorie : Decodable, Identifiable, Hashable
{
    
    var id : String
    var PhotoCategorie : String
    var NomCategorie : String
    var NbreTotalArticles : Int
}

