import Foundation

class ReservationService {
    static let shared = ReservationService()
    private init() {}

    func addReservation(commentaire: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let baseUrl = "https://recycleconnect.onrender.com/"
        let urlString = baseUrl + "api/reservation/"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let reservationData: [String: Any] = [
            "commentaire": commentaire,
            // Ajoutez d'autres champs de réservation selon les besoins
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: reservationData)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            // Vérifiez si la réponse est un succès (status code 2xx)
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                completion(.success(()))
            } else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
            }
        }

        task.resume()
    }
}
