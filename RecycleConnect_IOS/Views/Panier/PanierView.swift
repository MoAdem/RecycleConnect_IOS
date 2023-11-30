import SwiftUI

struct PanierView: View {
    @State private var livraisonSelected = false
    @State private var recupererSelected = false
    @State private var isDetailsLivListViewActive = false
    @State private var isPcCardViewActive = false

    var body: some View {
        NavigationView {
            VStack {
                // Display the number of items in the panier
                Text("Nombre d'articles dans le panier: 1")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 16)
                    .foregroundColor(Color(hex: "0C8A7B"))

                // List of items in the panier (replace with actual items)
                List {
                    Text("Article 1")
                        .foregroundColor(Color(hex: "0C8A7B"))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: "0C8A7B")))
                    Text("Article 2")
                        .foregroundColor(Color(hex: "0C8A7B"))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: "0C8A7B")))
                    Text("Article 3")
                        .foregroundColor(Color(hex: "0C8A7B"))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: "0C8A7B")))
                }
                .listStyle(PlainListStyle())

                // Stylish button to empty the panier
                Button("Vider le panier") {
                    // Action to empty the panier
                    deletePanier()
                }
                .buttonStyle(DynamicButtonStyle(color: "0C8A7B", shape: .capsule))
                .foregroundColor(.white)
                .padding(.top, 16)

                // Radio buttons for livraison and récupérer au point de collecte
                HStack {
                    RadioButton(text: "Livraison", isSelected: $livraisonSelected, otherSelected: $recupererSelected)
                        .padding(.trailing, 16)
                    RadioButton(text: "Récupérer au point de collecte", isSelected: $recupererSelected, otherSelected: $livraisonSelected)
                        .padding(.leading, 16)
                }
                .padding(.top, 16)

                // Modern button to validate the command
                Button("Valider la commande") {
                    if livraisonSelected && !recupererSelected {
                        // Transition to "DetailsLivListView"
                        isDetailsLivListViewActive = true
                    } else if recupererSelected && !livraisonSelected {
                        // Transition to "PcCardView"
                        isPcCardViewActive = true
                    }
                }
                .buttonStyle(DynamicButtonStyle(color: "0C8A7B", shape: .capsule))
                .foregroundColor(.white)
                .padding(.top, 16)

                Spacer()
            }
            .padding(16)
            .background(Color.gray.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading:
                Image("logo-panier-vert1")
                    .resizable()
                    .frame(width: 80, height: 80)
            )
        }
    }

    // Function to delete the panier
    private func deletePanier() {
        PanierService.shared.deletePanier(panierId: "654b7a9d37bdf7303959471a") { result in
            switch result {
            case .success:
                // Handle successful deletion, e.g., update the UI or show a message
                print("Panier deleted successfully")
            case .failure(let error):
                // Handle the error, e.g., show an alert
                print("Error deleting panier: \(error.localizedDescription)")
            }
        }
    }
}

struct PanierView_Previews: PreviewProvider {
    static var previews: some View {
        PanierView()
    }
}

struct RadioButton: View {
    var text: String
    @Binding var isSelected: Bool
    @Binding var otherSelected: Bool

    var body: some View {
        Button(action: {
            withAnimation {
                isSelected = true
                otherSelected = false
            }
        }) {
            HStack {
                Text(text)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: "0C8A7B")))
                    .foregroundColor(isSelected ? .blue : .black)
            }
        }
    }
}

struct DynamicButtonStyle: ButtonStyle {
    let color: String
    let shape: ButtonShape

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(shape.background(color: color))
            .foregroundColor(.white)
            .cornerRadius(shape.cornerRadius)
    }
}

enum ButtonShape {
    case roundedRectangle
    case capsule

    var cornerRadius: CGFloat {
        switch self {
        case .roundedRectangle:
            return 8
        case .capsule:
            return 20
        }
    }

    func background(color: String) -> some View {
        Color(hex: color)
    }
}

/*struct DetailsLivListView: View {
    // Contenu de la vue "DetailsLivListView"
}

struct PcCardView: View {
    // Contenu de la vue "PcCardView"
}
*/
