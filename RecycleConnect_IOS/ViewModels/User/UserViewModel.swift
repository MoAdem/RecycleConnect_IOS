//
//  UserViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation


class UserViewModel: ObservableObject {
    func createUser(email: String, username: String,
                    telephone:String, address: String, password: String, role: String, completion: @escaping (Result<String, Error>) -> Void) {
    
        guard let url = URL(string: "http://localhost:5000/api/user/create") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
    
        let user = [
            "email": email,
            "username": username,
            "address": address,
            "password": password,
            "telephone": telephone,
            "role": role
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: user, options: .prettyPrinted)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
               
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    let responseString = String(data: data, encoding: .utf8) ?? ""
                    completion(.success(responseString))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
}
