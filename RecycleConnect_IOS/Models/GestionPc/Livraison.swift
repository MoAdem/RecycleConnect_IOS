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
}*/
import Foundation

struct Livraisonn: Codable, Identifiable {
    let id: String
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

    init(id: String = "",
         Nom_Article: String,
         Nom_Client: String,
         address_mail_Client: String,
         numero_Client: Double,
         ville: String,
         address_Client: String) {
        self.id = id
        self.Nom_Article = Nom_Article
        self.Nom_Client = Nom_Client
        self.address_mail_Client = address_mail_Client
        self.numero_Client = numero_Client
        self.ville = ville
        self.address_Client = address_Client
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        Nom_Article = try container.decode(String.self, forKey: .Nom_Article)
        Nom_Client = try container.decode(String.self, forKey: .Nom_Client)
        address_mail_Client = try container.decode(String.self, forKey: .address_mail_Client)
        numero_Client = try container.decode(Double.self, forKey: .numero_Client)
        ville = try container.decode(String.self, forKey: .ville)
        address_Client = try container.decode(String.self, forKey: .address_Client)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(Nom_Article, forKey: .Nom_Article)
        try container.encode(Nom_Client, forKey: .Nom_Client)
        try container.encode(address_mail_Client, forKey: .address_mail_Client)
        try container.encode(numero_Client, forKey: .numero_Client)
        try container.encode(ville, forKey: .ville)
        try container.encode(address_Client, forKey: .address_Client)
    }
}




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
