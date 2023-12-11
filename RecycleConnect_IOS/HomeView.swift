import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OrgEventsView()) {
                    Text("My Events")
                        .padding()
                        .background(Color.colorGreen)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                NavigationLink(destination: AddEventView()) {
                    Text("Add Event")
                        .padding()
                        .background(Color.colorGreen)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                    .navigationTitle("Home")
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



