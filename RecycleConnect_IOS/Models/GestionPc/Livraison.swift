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
}

