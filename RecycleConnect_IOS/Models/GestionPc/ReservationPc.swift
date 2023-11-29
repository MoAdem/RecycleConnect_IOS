//
//  ReservationPc.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 28/11/2023.
//

import Foundation
//import SwiftUI

struct ReservationPc: Identifiable {
    let id = UUID()
    let Nom_R: String
    let id_Pc: String
}

let sampleReservationPcs: [ReservationPc] = [
    ReservationPc(Nom_R: "Commande 1", id_Pc: "Point Collecte 1"),
    ReservationPc(Nom_R: "Commande 2", id_Pc: "Point Collecte 2"),
]
