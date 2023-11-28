//
//  UserService.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation
class UserServices {
    static let shared = UserServices()
    
    func getAllUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let url = URL(string: "http://localhost:9090/user/")!
        
        
        var request =  URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("1")
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                print("navigation didn't work ")
                return
            }
            
            do {
                print("2")
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            }catch {
                print(String(describing: error))
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    
    func registerUser(firstName: String, lastName: String, username: String, password: String, email: String, phoneNumber: String, role: String, archived: Bool ,completion: @escaping (Result<String, Error>) -> Void) {
        
        let urlString = "http://localhost:9090/auth/register/user"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        
        let parameters: [String: Any] = [
            "firstName" : firstName,
            "lastName" : lastName,
            "username" : username,
            "password" : password,
            "email" : email,
            "phoneNumber" : phoneNumber,
            "role" : role,
            "archived" : archived
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch{
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let message = json?["message"] as? String {
                    completion(.success(message))
                }else if let errorMessage = json?["error"] as? String {
                    completion(.failure(NSError(domain: errorMessage, code: 0, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unexpected response", code: 0, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }
            task.resume()
    }
    
    
    
    func registerOrganisation(organisationName: String, username: String, password: String, email: String, phoneNumber: String, role: String, archived: Bool, description: String, address: String ,completion: @escaping (Result<String, Error>) -> Void) {
        
        let urlString = "http://localhost:9090/auth/register/organisation"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        
        let parameters: [String: Any] = [
            "organisationName" : organisationName,
            "username" : username,
            "password" : password,
            "email" : email,
            "phoneNumber" : phoneNumber,
            "description" : description,
            "address" : address,
            "role" : role,
            "archived" : archived
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch{
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let message = json?["message"] as? String {
                    completion(.success(message))
                }else if let errorMessage = json?["error"] as? String {
                    completion(.failure(NSError(domain: errorMessage, code: 0, userInfo: nil)))
                } else {
                    completion(.failure(NSError(domain: "Unexpected response", code: 0, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }
            task.resume()
    }
    
    
    
    
}
