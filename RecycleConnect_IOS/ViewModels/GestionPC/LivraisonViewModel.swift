/*import Foundation
import Combine

class LivraisonViewModel: ObservableObject {
    @Published var livraisons = [Livraisonn]()
    
    private var cancellables: Set<AnyCancellable> = []
    func fetchData() {
        guard let url = URL(string: "http://localhost:5000/livraison") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [Livraisonn].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            } receiveValue: { livraisons in
                self.livraisons = livraisons
            }
            .store(in: &cancellables)
    }
}
 */
/*

import Foundation

class LivraisonViewModel: ObservableObject {
    @Published var showErrorMessages = false
    @Published var isNavigationActive = false
    @Published var livraisons: [Livraisonn] = []

    // MARK: - POST Method
    func sendLivraisonToServer(nomArticle: String, nomClient: String, addressMailClient: String, numeroClient: String, selectedVille: String, addressClient: String) {
        guard validateInputs(nomArticle: nomArticle, nomClient: nomClient, addressMailClient: addressMailClient, numeroClient: numeroClient, selectedVille: selectedVille, addressClient: addressClient) else {
            return
        }

        let livraison = Livraisonn(Nom_Article: nomArticle,
                                   Nom_Client: nomClient,
                                   address_mail_Client: addressMailClient,
                                   numero_Client: Double(numeroClient) ?? 0,
                                   ville: selectedVille,
                                   address_Client: addressClient)

        // Convert the Swift struct to JSON data
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(livraison) else {
            print("Failed to encode data")
            return
        }

        // Set up the URL for your backend endpoint
        guard let url = URL(string: "http://localhost:5000/livraison") else {
            print("Invalid URL")
            return
        }

        // Set up the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Make the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let data = data {
                    // Parse the response JSON if needed
                    if let responseJson = try? JSONSerialization.jsonObject(with: data, options: []) {
                        print("Response: \(responseJson)")
                        // Handle the successful response (e.g., show a success message)
                        self.showErrorMessages = true
                        self.isNavigationActive = true
                    }
                }
            }
        }.resume()
    }

    // MARK: - GET Method
    func getLivraisonsFromServer() {
        guard let url = URL(string: "http://localhost:5000/livraison") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let data = data {
                    // Parse the response JSON
                    do {
                        let livraisons = try JSONDecoder().decode([Livraisonn].self, from: data)
                        self.livraisons = livraisons
                    } catch {
                        print("Error decoding JSON: \(error)")
                        // Handle the error (e.g., show an error message)
                    }
                }
            }
        }.resume()
    }
    func deleteLivraisonFromServer(id: UUID) {
        guard let url = URL(string: "http://localhost:5000/livraison/\(id)") else {
            print("Invalid URL")
            return
        }

        // Set up the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        // Make the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    // Handle successful deletion
                    print("Livraison deleted successfully")
                }
            }
        }.resume()
    }
    

    // MARK: - Validation Method
    private func validateInputs(nomArticle: String, nomClient: String, addressMailClient: String, numeroClient: String, selectedVille: String, addressClient: String) -> Bool {
        // Add your validation logic here
        return true
    }
}

*/
import Foundation

class LivraisonViewModel: ObservableObject {
    @Published var showErrorMessages = false
    @Published var isNavigationActive = false
    @Published var livraisons: [Livraisonn] = []

    // MARK: - POST Method
    func sendLivraisonToServer(nomArticle: String, nomClient: String, addressMailClient: String, numeroClient: String, selectedVille: String, addressClient: String) {
        guard validateInputs(nomArticle: nomArticle, nomClient: nomClient, addressMailClient: addressMailClient, numeroClient: numeroClient, selectedVille: selectedVille, addressClient: addressClient) else {
            return
        }

        let livraison = Livraisonn(Nom_Article: nomArticle,
                                   Nom_Client: nomClient,
                                   address_mail_Client: addressMailClient,
                                   numero_Client: Double(numeroClient) ?? 0,
                                   ville: selectedVille,
                                   address_Client: addressClient)

        // Convert the Swift struct to JSON data
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(livraison) else {
            print("Failed to encode data")
            return
        }

        // Set up the URL for your backend endpoint
        guard let url = URL(string: "http://localhost:5000/livraison") else {
            print("Invalid URL")
            return
        }

        // Set up the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Make the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error sending Livraison: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let data = data {
                    // Parse the response JSON if needed
                    if let responseJson = try? JSONSerialization.jsonObject(with: data, options: []) {
                        print("Response: \(responseJson)")
                        // Handle the successful response (e.g., show a success message)
                        self.showErrorMessages = true
                        self.isNavigationActive = true
                    }
                }
            }
        }.resume()
    }

    // MARK: - GET Method
    func getLivraisonsFromServer() {
        guard let url = URL(string: "http://localhost:5000/livraison") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error getting Livraisons: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let data = data {
                    // Parse the response JSON
                    do {
                        let livraisons = try JSONDecoder().decode([Livraisonn].self, from: data)
                        self.livraisons = livraisons
                    } catch {
                        print("Error decoding JSON: \(error)")
                        // Handle the error (e.g., show an error message)
                    }
                }
            }
        }.resume()
    }

    // MARK: - DELETE Method
    func deleteLivraisonFromServer(id: UUID) {
        guard let url = URL(string: "http://localhost:5000/livraison/\(id)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        // Make the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error deleting Livraison: \(error)")
                    // Handle the error (e.g., show an error message)
                } else if let response = response as? HTTPURLResponse {
                    print("Response Status Code: \(response.statusCode)")
                    if response.statusCode == 200 {
                        // Handle successful deletion
                        print("Livraison deleted successfully")
                    }
                }
            }
        }.resume()
    }

    // MARK: - Validation Method
    private func validateInputs(nomArticle: String, nomClient: String, addressMailClient: String, numeroClient: String, selectedVille: String, addressClient: String) -> Bool {
        // Add your validation logic here
        return true
    }
}
