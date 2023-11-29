//
//  EventListView.swift
//  OrogEvents
//
//  Created by Med Adem Torkhani on 26/11/2023.
//

import SwiftUI



struct EventListView: View {
    
    @State private var events: [Events] = []
    @State private var isShowingDetailView = false
        
    var body: some View {
        ZStack{
            NavigationView {
                List(events, id: \._id) { event in
                    EventListCell(event: event)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("Events")
                .listStyle(.plain)
            }
            .onAppear() {
                getEvents()
            }
            .blur(radius: isShowingDetailView ? 20 : 0)
            if isShowingDetailView {
                EventDetailView(event: MockData.sampleEvent, isShowingDetailView: $isShowingDetailView)
            }
            
        }

    }
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

#if DEBUG
struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
#endif
