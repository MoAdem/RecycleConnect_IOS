//
//  UserModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation


struct User: Codable,Hashable {
    let username: String
    let email: String
    let address: String
    let password: String
    let role: String
}


