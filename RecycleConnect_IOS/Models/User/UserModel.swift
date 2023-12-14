//
//  UserModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 14/12/2023.
//

import Foundation
import SwiftUI
import CoreData

struct UserResponse: Codable {
    let message: String
    let user: User
    let token: String
}

struct User: Codable {
    let _id: String
    let username: String
    let email: String
    let address: String
    let password: String
    let telephone: Int
    let role: String
    let __v: Int
  // let resetCode :String
    enum CodingKeys: String, CodingKey {
        case _id, username, email, address, password, telephone, role, __v
    }
}

