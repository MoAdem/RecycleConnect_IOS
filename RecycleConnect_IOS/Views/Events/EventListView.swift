//
//  EventListView.swift
//  OrogEvents
//
//  Created by Med Adem Torkhani on 26/11/2023.
//

import SwiftUI



struct EventListView: View {
    
    @StateObject var eventViewModel = EventViewModel()
    @State private var isShowingDetailView = false
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
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("Events")
                .listStyle(.plain)
                .searchable(text: $searchTerm, prompt: "search events")
            }
            .onAppear() {
                eventViewModel.getEvents()
            }
            .blur(radius: isShowingDetailView ? 20 : 0)
            if isShowingDetailView {
                EventDetailView(event: MockData.sampleEvent, isShowingDetailView: $isShowingDetailView)
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
