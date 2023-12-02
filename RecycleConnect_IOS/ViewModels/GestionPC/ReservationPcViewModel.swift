//
//  ReservationPcViewModel.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 2/12/2023.
//
/*
import Foundation
import Combine

*/
/*
import Foundation

class ReservationPcViewModel: ObservableObject {
    @Published var isReservationSuccessful = false

    func addReservation(reservationPc: ReservationPc) {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("URL non valide")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(reservationPc)
            request.httpBody = jsonData
        } catch {
            print("Erreur lors de l'encodage des données: \(error.localizedDescription)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Erreur de réseau: \(error?.localizedDescription ?? "Inconnu")")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Code d'état HTTP: \(httpResponse.statusCode)")

                if httpResponse.statusCode == 200 {
                    // La demande a réussi
                    DispatchQueue.main.async {
                        self.isReservationSuccessful = true
                    }
                } else {
                    print("Erreur de réponse du serveur")
                }
            }
        }.resume()
    }
}
*/
/*
import Foundation

class ReservationPcViewModel: ObservableObject {
    @Published var isReservationSuccessful = false

    func addReservation(pcId: String) {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("URL non valide")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let reservationPc = ReservationPc(Nom_R: "karim_kekli", id_Pc: pcId)
            let jsonData = try JSONEncoder().encode(reservationPc)
            request.httpBody = jsonData
        } catch {
            print("Erreur lors de l'encodage des données: \(error.localizedDescription)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Erreur de réseau: \(error?.localizedDescription ?? "Inconnu")")
                return
            }

            print("Réponse brute du serveur: \(String(data: data, encoding: .utf8) ?? "Impossible de lire les données")")

            if let httpResponse = response as? HTTPURLResponse {
                print("Code d'état HTTP: \(httpResponse.statusCode)")

                do {
                    let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                    print("Réponse du serveur: \(decodedData)")

                    if httpResponse.statusCode == 200 {
                        // La demande a réussi
                        DispatchQueue.main.async {
                            self.isReservationSuccessful = true
                        }
                    } else {
                        print("Erreur de réponse du serveur")
                    }
                } catch {
                    print("Erreur lors du décodage de la réponse: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
*/
/*
import SwiftUI

class ReservationPcViewModel: ObservableObject {
    @Published var isReservationSuccessful = false

    func addReservation(pcId: String) {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("URL non valide")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let reservationPc = ReservationPc(Nom_R: "karim_kekli", id_Pc: pcId)
            
            let jsonData = try JSONEncoder().encode(reservationPc)
            request.httpBody = jsonData
        } catch {
            print("Erreur lors de l'encodage des données: \(error.localizedDescription)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Erreur de réseau: \(error?.localizedDescription ?? "Inconnu")")
                return
            }

            print("Réponse brute du serveur: \(String(data: data, encoding: .utf8) ?? "Impossible de lire les données")")

            if let httpResponse = response as? HTTPURLResponse {
                print("Code d'état HTTP: \(httpResponse.statusCode)")

                do {
                    // Utilisez le décodage JSON standard de Swift
                    let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                    print("Réponse du serveur: \(decodedData)")

                    if httpResponse.statusCode == 200 {
                        // La demande a réussi
                        DispatchQueue.main.async {
                            self.isReservationSuccessful = true
                        }
                    } else {
                        print("Erreur de réponse du serveur")
                    }
                } catch {
                    print("Erreur lors du décodage de la réponse: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
*/
/*
import Foundation

class ReservationPcViewModel: ObservableObject {
    @Published var reservationPcs: [ReservationPc] = []
    @Published var showErrorMessages = false

    func getReservationPcsFromServer() {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Gérer l'erreur (par exemple, afficher un message d'erreur)
                    self.showErrorMessages = true
                } else if let data = data {
                    // Convertir les données JSON en tableau de ReservationPc
                    do {
                        let reservationPcs = try JSONDecoder().decode([ReservationPc].self, from: data)
                        self.reservationPcs = reservationPcs
                    } catch {
                        print("Error decoding JSON: \(error)")
                        // Gérer l'erreur de décodage (par exemple, afficher un message d'erreur)
                        self.showErrorMessages = true
                    }
                }
            }
        }.resume()
    }
}
*/
import Foundation

class ReservationPcViewModel: ObservableObject {
    @Published var reservationPcs: [ReservationPc] = []
    @Published var showErrorMessages = false

    func getReservationPcsFromServer() {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Gérer l'erreur (par exemple, afficher un message d'erreur)
                    self.showErrorMessages = true
                } else if let data = data {
                    // Convertir les données JSON en tableau de ReservationPc
                    do {
                        let reservationPcs = try JSONDecoder().decode([ReservationPc].self, from: data)
                        self.reservationPcs = reservationPcs
                    } catch {
                        print("Error decoding JSON: \(error)")
                        // Gérer l'erreur de décodage (par exemple, afficher un message d'erreur)
                        self.showErrorMessages = true
                    }
                }
            }
        }.resume()
    }
}
