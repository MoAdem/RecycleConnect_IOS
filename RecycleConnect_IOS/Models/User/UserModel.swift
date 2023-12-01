//
//  UserModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation

struct User: Codable, Hashable {
    var username: String
    var email: String
    var address: String
    var password: String
    var role: String
}
func handleJSONResponse(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode(User.self, from: jsonData)
        print(decodedData) 
    } catch let error {
        print("Decoding error:", error)
        if let decodingError = error as? DecodingError {
            print("Decoding error:", decodingError)
        }
    }
}
