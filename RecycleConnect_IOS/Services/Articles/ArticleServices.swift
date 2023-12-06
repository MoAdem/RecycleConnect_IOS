//
//  ArticleServices.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation

class ArticleServices {
    static let shared = ArticleServices()
        
        let baseURL = "http://localhost:5000/api/articles"
        
        enum NetworkError: Error {
            case invalidURL
            case serializationError
            case decodingError
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
                    print("Received Articles JSON string: \(jsonString)")
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



    
    
    
    
    func CreateArticle(NomArticle: String, NbreTotalArticles: Int, completion: @escaping (Result<article, Error>) -> Void) {
        let parameters: [String: Any] = [
            "NomArticle": NomArticle,
            "NbreTotalArticles": NbreTotalArticles
        ]

        guard let url = URL(string: baseURL + "CreateArticle") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            completion(.failure(NetworkError.serializationError))
            return
        }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let Article = try JSONDecoder().decode(article.self, from: data)
                    completion(.success(Article))
                } catch {
                    completion(.failure(NetworkError.decodingError))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
