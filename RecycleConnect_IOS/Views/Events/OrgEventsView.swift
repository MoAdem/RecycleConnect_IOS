import SwiftUI

struct OrgEventsView: View {
    @StateObject var eventViewModel = EventViewModel()
    @State private var searchTerm = ""

    var filteredEvents: [Events] {
        guard !searchTerm.isEmpty else { return eventViewModel.events }
        return eventViewModel.events.filter { $0.nameEvent.localizedStandardContains(searchTerm) }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredEvents, id: \._id) { event in
                    OrgEventListCell(event: event)
                }
                .onDelete { indexSet in
                    // Use deleteEvent from EventViewModel here
                    deleteEvents(at: indexSet)
                }
            }
            .navigationTitle("Your Org Events")
            .listStyle(.plain)
            .searchable(text: $searchTerm, prompt: "Search events")
        }
        .onAppear() {
            eventViewModel.getEvents()
        }
        if eventViewModel.isLoding {
            LodingView()
        }
    }

    private func deleteEvents(at offsets: IndexSet) {
        // Handle deletion of events
        // You need to update your data source (e.g., eventViewModel.events) accordingly
        eventViewModel.deleteEvent(at: offsets.first ?? 0)
    }
}

struct OrgEventsView_Preview: PreviewProvider {
    static var previews: some View {
        OrgEventsView()
    }
}



