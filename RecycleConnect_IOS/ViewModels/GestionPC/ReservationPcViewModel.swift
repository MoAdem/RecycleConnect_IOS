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
    // Dans ReservationPcViewModel
    func deleteReservationPc(id: UUID) {
        guard var urlComponents = URLComponents(string: "http://localhost:5000/reservationPc") else {
            print("Invalid URL")
            return
        }

        // Ajouter le paramètre action=delete
        urlComponents.queryItems = [URLQueryItem(name: "action", value: "delete")]

        guard let url = urlComponents.url else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        // Ajouter l'ID de la réservation à supprimer dans le corps de la requête
        request.httpBody = try? JSONEncoder().encode(["id": id])

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Gérer l'erreur
                    self.showErrorMessages = true
                } else if let _ = data {
                    // Mettez à jour votre modèle de données ou effectuez d'autres actions nécessaires après la suppression
                }
            }
        }.resume()
    }
}

/*
import Foundation

// ViewModel pour la gestion des réservations PC
class ReservationPcViewModel: ObservableObject {
    @Published var reservationPcs: [ReservationPc] = []
    @Published var showErrorMessages = false

    // Fonction pour récupérer les réservations PC depuis le serveur
    func getReservationPcsFromServer() {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Gérer l'erreur (par exemple, afficher un message d'erreur à l'utilisateur)
                    self.showErrorMessages = true
                } else if let data = data {
                    // Convertir les données JSON en tableau de ReservationPc
                    do {
                        let reservationPcs = try JSONDecoder().decode([ReservationPc].self, from: data)
                        self.reservationPcs = reservationPcs
                    } catch {
                        print("Error decoding JSON: \(error)")
                        // Gérer l'erreur de décodage (par exemple, afficher un message d'erreur à l'utilisateur)
                        self.showErrorMessages = true
                    }
                }
            }
        }.resume()
    }
}*/
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
                    self.showErrorMessages = true
                } else if let data = data {
                    do {
                        let reservationPcs = try JSONDecoder().decode([ReservationPc].self, from: data)
                        self.reservationPcs = reservationPcs
                    } catch {
                        print("Error decoding JSON: \(error)")
                        self.showErrorMessages = true
                    }
                }
            }
        }.resume()
    }

    func addReservationPc(pcId: String) {
        guard let url = URL(string: "http://localhost:5000/reservationPc") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let newReservation = ReservationPc(Nom_R: "Nom de la réservation", id_Pc: pcId)


        do {
            let jsonData = try JSONEncoder().encode(newReservation)
            request.httpBody = jsonData
        } catch {
            print("Error encoding reservation data: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                // Gérer l'erreur
            } else if let data = data {
                // Analyser les données de réponse si nécessaire
            }
        }.resume()
    }
}
*/


