//
//  NetworkManager.swift
//  OrogEvents
//
//  Created by Med adem Torkhani   on 27/11/2023.
//

import Foundation
final class EventsServices {
    static let shared = EventsServices()
    
    static let baseUrl = "https://recycleconnect.onrender.com/api/events"
    static let eventsUrl = baseUrl + "api/events"
    
    private init() {}
    
    func getEvents(completion: @escaping (Result<[Events], EVError>) -> Void) {
        guard let url = URL(string: EventsServices.baseUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            print("Response Status Code: \(response.statusCode)")

            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(EventsResponse.self, from: data)
                completion(.success(decodedResponse.events))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
