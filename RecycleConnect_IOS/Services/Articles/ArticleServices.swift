//
//  ArticleServices.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation
import SwiftUI

class ArticleServices {
    static let shared = ArticleServices()
        
        let baseURL = "http://localhost:5000/api/articles"
        
        enum NetworkError: Error {
            case invalidURL
            case serializationError
            case decodingError
            case photoNotProvided
            case serverError(String)
        }
        
    
    func GetAllArticles(completion: @escaping (Result<[article], Error>) -> Void) {
            guard let url = URL(string: baseURL) else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
        
            var request = URLRequest(url: url)
            request.httpMethod = "GET"


            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }


                guard let data = data else {
                    print("No data received")
                    completion(.failure(NetworkError.decodingError))
                    return
                }


                if let jsonString = String(data: data, encoding: .utf8) {
                    //print("Received Articles JSON string: \(jsonString)")
                } else {
                    print("Received data is not a valid UTF-8 string.")
                }


                do {
                    let articles = try JSONDecoder().decode([article].self, from: data)
                    completion(.success(articles))
                } catch {
                    print("Decoding error: \(error)")
                    completion(.failure(error))
                }
            }.resume()
        }



    
    func GetArticleById(articleId: String, completion: @escaping (Result<article, Error>) -> Void) {
            guard let url = URL(string: "http://localhost:5000/api/articles/\(articleId)") else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                
                do {
                    let article = try JSONDecoder().decode(article.self, from: data!)
                    completion(.success(article))
                } catch {
                    completion(.failure(NetworkError.decodingError))
                }
            }.resume()
        }
    

    
    
    
    func DeleteArticle(articleId: String, completion: @escaping (Result<Void, Error>) -> Void) {
            guard let url = URL(string: "\(baseURL)/\(articleId)") else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    completion(.success(()))
                } else {
                    completion(.failure(NetworkError.decodingError))
                }
            }.resume()
        }

    
    
    
    func CreateArticle(
        //id: String,
        NomArticle: String,
        DescriptionArticle: String,
        EtatArticle: String,
        CategorieId: String,
        PhotoArticleData: Data?,
        completion: @escaping (Result<article, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "http://localhost:5000/api/articles/") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
       let id = ""
        var requestBody: [String: Any] = [
            //"_id": id,
            "NomArticle": NomArticle,
            "DescriptionArticle": DescriptionArticle,
            "EtatArticle": EtatArticle,
            "CategorieId": CategorieId
        ]
        
        // Convert image data to base64 if available
        if let photoData = PhotoArticleData {
            let base64String = photoData.base64EncodedString()
            requestBody["PhotoArticleData"] = base64String
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(.serializationError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error as! ArticleServices.NetworkError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let article = try decoder.decode(article.self, from: data)
                completion(.success(article))
            } catch {
                print("Decoding error:", error)
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .dataCorrupted(let context):
                        print("Data corrupted:", context)
                    case .keyNotFound(let key, let context):
                        print("Key '\(key)' not found:", context.debugDescription)
                    case .valueNotFound(let value, let context):
                        print("Value '\(value)' not found:", context.debugDescription)
                    case .typeMismatch(let type, let context):
                        print("Type '\(type)' mismatch:", context.debugDescription)
                    default:
                        break
                    }
                }
                completion(.failure(.decodingError))
            }
        }.resume()
    }













}