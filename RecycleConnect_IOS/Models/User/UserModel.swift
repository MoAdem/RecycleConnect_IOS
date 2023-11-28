//
//  UserModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation

struct User: Hashable, Codable{
    var _id: String
    var firstName: String
    var lastName: String
    var username: String
    var password: String
    var email: String
    var phoneNumber: String
    var role: String
    var archived: Bool
}
