//
//  ReservationPc.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import Foundation
//import SwiftUI

struct ReservationPc: Identifiable, Codable {
    var id = UUID()
    let Nom_R: String
    let id_Pc: String
}

let sampleReservationPcs: [ReservationPc] = [
    ReservationPc(Nom_R: "Commande 1", id_Pc: "Point Collecte 1"),
    ReservationPc(Nom_R: "Commande 2", id_Pc: "Point Collecte 2"),
]
*/
/*
import Foundation

struct ReservationPc: Identifiable, Codable {
    var id = UUID()
    let Nom_R: String
    let id_Pc: String
}
*/
/*
import Foundation

// Modèle pour représenter une réservation PC
struct ReservationPc: Identifiable, Codable {
    var id: UUID?
    let Nom_R: String
    let id_Pc: String
    
    // Enum pour spécifier la correspondance entre les noms des propriétés et les clés JSON
    enum CodingKeys: String, CodingKey {
        case id
        case Nom_R
        case id_Pc
    }
    
    // Initialisateur pour personnaliser le décodage
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Utilisation de decodeIfPresent pour id afin qu'il soit facultatif
        id = try container.decodeIfPresent(UUID.self, forKey: .id)
        Nom_R = try container.decode(String.self, forKey: .Nom_R)
        id_Pc = try container.decode(String.self, forKey: .id_Pc)
    }
    
    // Initialisateur par défaut pour créer une nouvelle instance sans spécifier l'argument facultatif id
    init(Nom_R: String, id_Pc: String) {
        self.id = nil
        self.Nom_R = Nom_R
        self.id_Pc = id_Pc
    }
}
    extension ReservationPc {
        var safeID: UUID {
            return id ?? UUID()
        }
}
*/
import Foundation

// Modèle pour représenter une réservation PC
struct ReservationPc: Identifiable, Codable {
    var id: UUID?
    let Nom_R: String
    let id_Pc: String
    
    // Enum pour spécifier la correspondance entre les noms des propriétés et les clés JSON
    enum CodingKeys: String, CodingKey {
        case id
        case Nom_R
        case id_Pc
    }
    
    // Initialisateur pour personnaliser le décodage
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Utilisation de decodeIfPresent pour id afin qu'il soit facultatif
        id = try container.decodeIfPresent(UUID.self, forKey: .id)
        Nom_R = try container.decode(String.self, forKey: .Nom_R)
        id_Pc = try container.decode(String.self, forKey: .id_Pc)
    }
    
    // Initialisateur par défaut pour créer une nouvelle instance sans spécifier l'argument facultatif id
    init(Nom_R: String, id_Pc: String) {
        self.id = nil
        self.Nom_R = Nom_R
        self.id_Pc = id_Pc
    }
}
    extension ReservationPc {
        var safeID: UUID {
            return id ?? UUID()
        }
}
