//
//  EventViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

final class EventViewModel: ObservableObject {
    @Published var events: [Events] = []
    @Published var event: Events?
    @Published var alertItem: AlertItem?
    @Published var isLoding = false
    @Published var isShowingDetailView = false
    @Published var selectedEvent: Events?

    
    func getEvents() {
        isLoding = true
        EventsServices.shared.getEvents { [self] result in
            DispatchQueue.main.async {
                isLoding = false
                switch result {
                case .success(let events):
                    self.events = events
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    func deleteEvent(at index: Int) {
            let eventIdToDelete = events[index]._id
            isLoding = true
            EventsServices.shared.deleteEvent(id: eventIdToDelete) { [self] result in
                DispatchQueue.main.async {
                    isLoding = false
                    switch result {
                    case .success(let response):
                        if response.success {
                            events.remove(at: index)
                        } else {
                            alertItem = AlertItem(title: Text("Delete Failed"), message: Text(response.message), dismissButton: .default(Text("OK")))
                        }
                    case .failure(let error):
                        handleServiceError(error)
                    }
                }
            }
        }
    
    // Add this method to your EventViewModel
    func createEvent(name: String, description: String, address: String, start: Date, photo: Data?) {
        isLoding = true
        
        // Format the start date to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startEventString = dateFormatter.string(from: start)
        
        // Convert photo data to base64-encoded string
        let photoString = photo?.base64EncodedString() ?? ""
        
        EventsServices.shared.createEvent(nameEvent: name, descriptionEvent: description, addressEvent: address, startEvent: startEventString, PhotoEvent: photoString) { [self] result in
            DispatchQueue.main.async {
                isLoding = false
                switch result {
                case .success(let event):
                    events.append(event)
                case .failure(let error):
                    handleServiceError(error)
                }
            }
        }
    }










        private func handleServiceError(_ error: EVError) {
            switch error {
            case .invalidURL:
                alertItem = AlertContext.invalidURL
            case .invalidResponse:
                alertItem = AlertContext.invalidResponse
            case .invalidData:
                alertItem = AlertContext.invalidData
            case .unableToComplete:
                alertItem = AlertContext.unableToComplete
            }
        }




    
}
