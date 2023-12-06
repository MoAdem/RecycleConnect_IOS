//
//  EventListView.swift
//  OrogEvents
//
//  Created by Med Adem Torkhani on 26/11/2023.
//

import SwiftUI



struct EventListView: View {
    
    @StateObject var eventViewModel = EventViewModel()
    @State private var searchTerm = ""
    
    var filteredEvents: [Events] {
        guard !searchTerm.isEmpty else {return eventViewModel.events}
        return eventViewModel.events.filter { $0.nameEvent.localizedStandardContains(searchTerm)}
    }
        
    var body: some View {
        ZStack{
            NavigationView {
                List(filteredEvents, id: \._id) { event in
                    EventListCell(event: event)
                        .onTapGesture {
                            eventViewModel.isShowingDetailView = true
                            eventViewModel.selectedEvent = event
                        }
                }
                .navigationTitle("Events")
                .listStyle(.plain)
                .searchable(text: $searchTerm, prompt: "search events")
            }
            .onAppear() {
                eventViewModel.getEvents()
            }
            .blur(radius: eventViewModel.isShowingDetailView ? 20 : 0)
            if eventViewModel.isShowingDetailView {
                EventDetailView(event: eventViewModel.selectedEvent!, isShowingDetailView: $eventViewModel.isShowingDetailView)
            }
            if eventViewModel.isLoding{
                LodingView()
            }

            
        }
        .alert(item: $eventViewModel.alertItem) { alertitem in
            Alert(title: alertitem.title,message: alertitem.message, dismissButton: alertitem.dismissButton)
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
