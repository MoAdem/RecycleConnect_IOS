//
//  ReservationPcViewModel.swift
//  RecycleConnect_IOS
//
//  Created by karimk on 2/12/2023.
//

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

}





