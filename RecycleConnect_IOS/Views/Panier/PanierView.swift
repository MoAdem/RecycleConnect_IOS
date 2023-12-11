import SwiftUI

struct Article: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct PanierView: View {
    @State private var livraisonSelected = false
    @State private var recupererSelected = false
    @State private var isDetailsLivListViewActive = false
    @State private var isPcCardViewActive = false
    @State private var showAlert = false
    @State private var selectedArticleId: String? = nil

    @State private var articles: [Article] = [
        Article(name: "Article 1"),
        Article(name: "Article 2"),
        Article(name: "Article 3")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Article Selectionné: \(articles.filter { $0.isSelected }.count)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 16)
                    .foregroundColor(Color(hex: "0C8A7B"))

                List {
                    ForEach(articles) { article in
                        VStack {
                            Text(article.name)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .swipeActions {
                                    Button("Supprimer") {
                                        deletePanierItem(article: article)
                                    }
                                    .tint(.red)
                                }
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    toggleSelection(for: article)
                                }
                                .rotation3DEffect(
                                    .degrees(article.isSelected ? 10 : 0),
                                    axis: (x: 0.5, y: 10.0, z: 0.5)
                                )
                                .animation(.spring())
                        }
                        .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deletePanierItems)
                }
                .listStyle(PlainListStyle())

                HStack {
                    RadioButton(text: "Livraison", isSelected: $livraisonSelected, otherSelected: $recupererSelected)
                        .padding(.trailing, 16)
                        .animation(.easeInOut)
                    RadioButton(text: "Récupérer au point de collecte", isSelected: $recupererSelected, otherSelected: $livraisonSelected)
                        .padding(.leading, 16)
                        .animation(.easeInOut)
                }
                .padding(.top, 16)

                Button("Valider la commande") {
                    if articles.isEmpty {
                        showAlert = true
                    } else {
                        if livraisonSelected && !recupererSelected {
                            isDetailsLivListViewActive = true
                        } else if recupererSelected && !livraisonSelected {
                            isPcCardViewActive = true
                        }
                        showAlert = true
                    }
                }
                .buttonStyle(DynamicButtonStyle(color: "0C8A7B", shape: .capsule))
                .foregroundColor(.white)
                .padding(.top, 16)
                .alert(isPresented: $showAlert) {
                    if articles.isEmpty {
                        return Alert(title: Text("Panier vide"), message: Text("Ajoutez des articles à votre panier pour valider la commande."), dismissButton: .default(Text("OK")))
                    } else {
                        return Alert(title: Text("Commande validée"), message: Text("Votre commande a été validée avec succès."), dismissButton: .default(Text("OK")))
                    }
                }

                Spacer()
            }
            .padding(16)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func deletePanierItem(article: Article) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles.remove(at: index)
        }
    }

    private func deletePanierItems(offsets: IndexSet) {
        articles.remove(atOffsets: offsets)
    }

    private func toggleSelection(for article: Article) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles[index].isSelected.toggle()
            selectedArticleId = articles[index].isSelected ? article.id.uuidString : nil
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
