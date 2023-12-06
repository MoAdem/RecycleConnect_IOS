//
//  PC.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//
/*
import Foundation

struct PC: Identifiable {
    let id = UUID()
    let Nom_Pc: String
    let address_Pc:String
    let address_mail_Pc: String
    let numero_tel: String
    let x: Double
    let y: Double
}

let samplePCs: [PC] = [
    PC(Nom_Pc: "Point Collecte Tunis", address_Pc: "Bardo", address_mail_Pc:"karim.kekli@esprit.tn" , numero_tel: "23363948", x: 0.0, y: 0.0),
    PC(Nom_Pc: "Point Collecte Sousse", address_Pc: "Kanawi", address_mail_Pc: "karim.kekli2000@gmail.com", numero_tel: "55575541", x: 1.0, y: 1.0),
    // Ajoutez autant de PCs que nécessaire
]
*/
/*
import Foundation

struct PC: Identifiable, Codable {
    let id = UUID()
    let Nom_Pc: String
    let address_Pc: String
    let address_mail_Pc: String
    let numero_tel: Int
    let x: Double
    let y: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case Nom_Pc = "Nom_Pc"
        case address_Pc = "address_Pc"
        case address_mail_Pc = "address_mail_Pc"
        case numero_tel = "numero_tel"
        case x = "x"
        case y = "y"
        
    }
}*/
import Foundation 
struct PC: Identifiable, Codable {
    let id: String // Change the type to String
    let Nom_Pc: String
    let address_Pc: String
    let address_mail_Pc: String
    let numero_tel: Int
    let x: Double
    let y: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case Nom_Pc = "Nom_Pc"
        case address_Pc = "address_Pc"
        case address_mail_Pc = "address_mail_Pc"
        case numero_tel = "numero_tel"
        case x = "x"
        case y = "y"
    }

    init() {
        self.id = UUID().uuidString // Convert UUID to String
        self.Nom_Pc = ""
        self.address_Pc = ""
        self.address_mail_Pc = ""
        self.numero_tel = 0
        self.x = 0.0
        self.y = 0.0
    }
}
