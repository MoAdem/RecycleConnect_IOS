//
//  EventViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

final class EventViewModel: ObservableObject {
    @Published var events: [Events] = []
    
    func getEvents() {
        EventsServices.shared.getEvents { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self.events = events
                case .failure(let error):
                    print(error.localizedDescription)
                
                }
            }
        }
    }
    
}
