//
//  UserViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var token = ""
    @Published var user: User?
    @Published var signupSuccessful = false
    var loggedInUserID: String?
    @Published var loggedInUserEmail: String?
    @Published var loggedInUsername: String?
    
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
            "username": username,
            "email": email,
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
    func createOrg(username: String, email: String, address: String, telephone: String, password: String, role: String, orgDescription: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/user/createOrg") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let orgData = [
            "username": username,
            "email": email,
            "address": address,
            "password": password,
            "telephone": telephone,
            "role": role,
            "org_description": orgDescription
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: orgData, options: .prettyPrinted)
            
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
    func loginUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/user/login") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let credentials :  [String: String] = [
            "username": username,
            "password": password
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: credentials)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error)")
                completion(.failure(error ?? NSError(domain: "Unknown error", code: 0, userInfo: nil)))
                return
            }
            
            print("Response data: \(String(data: data, encoding: .utf8) ?? "No data")")
            
            do {
                           let decoder = JSONDecoder()
                           let userResponse = try decoder.decode(UserResponse.self, from: data)
                           
                           DispatchQueue.main.async {
                               self.user = userResponse.user
                               self.loggedInUserID = userResponse.user._id
                               self.loggedInUserEmail = userResponse.user.email
                               self.loggedInUsername = userResponse.user.username
                               self.isLoggedIn = true
                               completion(.success(userResponse.user))
                           }
                       } catch {
                           print("Error decoding response:", error)
                           completion(.failure(error))
                       }
                   }.resume()
               }
    //reset password
    
    func forgotPassword(email: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/user/reset") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "email": email
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            
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
    
    //get user by id
    
    func fetchUser(_id: String) {
            guard let url = URL(string: "http://localhost:5000/api/user\(_id)") else {
                print("Invalid URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("No data returned: Unknown error")
                    return
                }
                
                do {
                    let decodedUser = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        self.user = decodedUser
                    }
                } catch {
                    print("Error decoding user data")
                }
            }
            .resume()
        }
    }
    

