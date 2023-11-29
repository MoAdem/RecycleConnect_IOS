//
//  PC.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

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


