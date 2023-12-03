//
//  Livraison.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import Foundation

struct Livraison {
    let _id = UUID()
    let Nom_Article: String
    let Nom_Client: String
    let address_mail_Client: String
    let numero_Client: String
    let ville: String
    let address_Client: String
}
*/
/*
 import Foundation
 
struct Livraisonn: Codable  {
 var _id = UUID()
 let Nom_Article: String
 let Nom_Client: String
 let address_mail_Client: String
 let numero_Client: Double
 let ville: String
 let address_Client: String
 }
*/
/*
import Foundation

struct Livraisonn: Codable, Identifiable {
    var id = UUID() // Ajoutez cette ligne pour conformer à Identifiable
    let Nom_Article: String
    let Nom_Client: String
    let address_mail_Client: String
    let numero_Client: Double
    let ville: String
    let address_Client: String
}*/

import Foundation
struct Livraisonn: Codable, Identifiable {
    let id = UUID()
    let Nom_Article: String
    let Nom_Client: String
    let address_mail_Client: String
    let numero_Client: Double
    let ville: String
    let address_Client: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case Nom_Article = "Nom_Article"
        case Nom_Client = "Nom_Client"
        case address_mail_Client = "address_mail_Client"
        case numero_Client = "numero_Client"
        case ville = "ville"
        case address_Client = "address_Client"
        
    }
}

// Livraisonn.swift

// Livraisonn.swift

// Livraisonn.swift
/*
 import Foundation

struct Livraisonn: Codable, Identifiable {
    var id: UUID?
    let Nom_Article: String
    let Nom_Client: String
    let address_mail_Client: String
    let numero_Client: Double
    let ville: String
    let address_Client: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case Nom_Article
        case Nom_Client
        case address_mail_Client
        case numero_Client
        case ville
        case address_Client
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let idString = try container.decodeIfPresent(String.self, forKey: .id) {
            id = UUID(uuidString: idString)
        }

        Nom_Article = try container.decode(String.self, forKey: .Nom_Article)
        Nom_Client = try container.decode(String.self, forKey: .Nom_Client)
        address_mail_Client = try container.decode(String.self, forKey: .address_mail_Client)
        numero_Client = try container.decode(Double.self, forKey: .numero_Client)
        ville = try container.decode(String.self, forKey: .ville)
        address_Client = try container.decode(String.self, forKey: .address_Client)
    }
}
*/
