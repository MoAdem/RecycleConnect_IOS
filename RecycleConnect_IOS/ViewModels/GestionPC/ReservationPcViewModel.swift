//
//  ReservationPcViewModel.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 2/12/2023.
//
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

    func deleteReservationPc(id: UUID) {
        guard let url = URL(string: "http://localhost:5000/reservationPc/\(id.uuidString)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error deleting reservation: \(error)")
                    self.showErrorMessages = true
                } else if let httpResponse = response as? HTTPURLResponse {
                    if (200..<300).contains(httpResponse.statusCode) {
                        // Successful deletion
                        print("Reservation deleted successfully.")
                        // Perform any additional actions on success
                    } else {
                        // Unsuccessful deletion
                        if let data = data, let errorResponse = try? JSONDecoder().decode([String: String].self, from: data) {
                            print("Failed to delete reservation. Status code: \(httpResponse.statusCode), Error: \(errorResponse["error"] ?? "Unknown error")")
                        } else {
                            print("Failed to delete reservation. Status code: \(httpResponse.statusCode)")
                        }
                        self.showErrorMessages = true
                    }
                }
            }
        }.resume()
    }

}*/

import Foundation

class ReservationPcViewModel: ObservableObject {
    @Published var reservationPcs: [ReservationPc] = []
    @Published var errorMessage: String?
    @Published var livraisons: [Livraisonn] = []

    // MARK: - POST Method
    

    
    func getReservationPcsFromServer() {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            errorMessage = "URL invalide"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "Erreur: \(error.localizedDescription)"
                } else if let data = data {
                    do {
                        self.reservationPcs = try ReservationPc.decode(from: data)
                    } catch {
                        self.errorMessage = "Erreur de décodage JSON: \(error.localizedDescription)"
                    }
                }
            }
        }.resume()
    }
    
    func deleteReservationPc(at index: Int) {
        guard index >= 0 && index < reservationPcs.count else {
            print("Index hors limites")
            return
        }
        
        guard let reservationPcID = reservationPcs[index].id else {
            print("ID de réservation manquant")
            return
        }
        
        guard let url = URL(string: "http://localhost:5000/reservationPc/\(reservationPcID)") else {
            print("URL invalide")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Erreur lors de la suppression :", error)
                    self.errorMessage = "Erreur lors de la suppression : \(error.localizedDescription)"
                } else if let response = response as? HTTPURLResponse {
                    print("Code de réponse après suppression :", response.statusCode)
                    if response.statusCode == 200 {
                        // Supprimer la réservation localement
                        self.reservationPcs.remove(at: index)
                    } else {
                        self.errorMessage = "La suppression a échoué avec le code de réponse \(response.statusCode)"
                    }
                }
            }
        }.resume()
    }

    func createReservation(nomR: String, idPc: String) {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            errorMessage = "URL invalide"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let reservation = ReservationPc(nomR: nomR, idPc: idPc) // Créez une instance de la réservation

        do {
            let jsonData = try JSONEncoder().encode(reservation)
            request.httpBody = jsonData
        } catch {
            print("Erreur d'encodage JSON:", error.localizedDescription)
            errorMessage = "Erreur d'encodage JSON: \(error.localizedDescription)"
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Erreur lors de la création de la réservation :", error)
                    self.errorMessage = "Erreur lors de la création de la réservation : \(error.localizedDescription)"
                } else if let response = response as? HTTPURLResponse {
                    print("Code de réponse après la création de la réservation :", response.statusCode)
                    if response.statusCode == 201 {
                        // La réservation a été créée avec succès
                        // Vous pouvez mettre à jour la liste des réservations ou effectuer d'autres actions nécessaires ici
                        self.getReservationPcsFromServer()
                    } else {
                        self.errorMessage = "La création de la réservation a échoué avec le code de réponse \(response.statusCode)"
                    }
                }
            }
        }.resume()
    }

}
