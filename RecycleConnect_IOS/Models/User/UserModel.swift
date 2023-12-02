//
//  UserModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation

struct User: Decodable{
    var username: String
    var email: String
    var address: String
    var password: String
    var telephone: String
    var role: String
    
    enum CodingKeys: String, CodingKey {
           case username, email, address, password, telephone, role
       }
}

