//
//  EventViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

final class EventViewModel: ObservableObject {
    @Published var events: [Events] = []
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
