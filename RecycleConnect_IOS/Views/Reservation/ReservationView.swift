import SwiftUI

struct ReservationView: View {
    let buttonColor = Color(hex: "0C8A7B")
    let buttonTextColor = Color.white
    @State private var commentaire: String = ""
    @State private var showAlert = false
    @State private var isPanierViewActive = false

    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .overlay(
                        VStack(alignment: .center, spacing: 16) {
                            Text("Nom de l'article")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(16)
                                .foregroundColor(buttonColor)

                            Text("Description de l'article")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)
                                .padding(.top, 8)
                                .foregroundColor(.gray)

                            TextEditor(text: $commentaire)
                                .frame(width: 300, height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(buttonColor, lineWidth: 2)
                                )
                                .padding([.horizontal, .top], 16)

                            Button("Ajouter au panier") {
                                ReservationService.shared.addReservation(commentaire: commentaire) { result in
                                    switch result {
                                    case .success:
                                        print("Commentaire ajouté avec succès")
                                        showAlert = true
                                    case .failure(let error):
                                        print("Erreur lors de l'ajout du commentaire : \(error.localizedDescription)")
                                    }
                                }
                            }
                            .foregroundColor(buttonTextColor)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(buttonColor))
                            .cornerRadius(20)
                            .padding(16)
                            .shadow(radius: 5)

                        }
                        .padding()
                    )
                    .padding([.horizontal, .top], 16)

                Spacer()
            }
            .background(Color.gray.edgesIgnoringSafeArea(.all))
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Ajout au panier"),
                    message: Text("Votre article a été ajouté au panier."),
                    dismissButton: .default(Text("OK")) {
                        isPanierViewActive = true
                    }
                )
            }
            .background(
                NavigationLink(
                    destination: PanierView(),
                    isActive: $isPanierViewActive,
                    label: {
                        EmptyView()
                    }
                )
                .hidden()
            )
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}

