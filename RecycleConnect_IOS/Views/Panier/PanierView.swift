import SwiftUI

struct PanierView: View {
    @State private var isLivraisonSelected = true
    @State private var showAlert = false

    @State private var articles: [article] = [
        article(id: "1", PhotoArticle: URL(string: "https://example.com/image1.jpg")!, NomArticle: "Article 1", DescriptionArticle: "Description de l'article 1", EtatArticle: "Good", Categorie: "Category 1", __v: 1, isSelected: false),
        article(id: "2", PhotoArticle: URL(string: "https://example.com/image2.jpg")!, NomArticle: "Article 2", DescriptionArticle: "Description de l'article 2", EtatArticle: "Excellent", Categorie: "Category 2", __v: 2, isSelected: false),
        article(id: "3", PhotoArticle: URL(string: "https://example.com/image3.jpg")!, NomArticle: "Article 3", DescriptionArticle: "Description de l'article 3", EtatArticle: "Average", Categorie: "Category 3", __v: 3, isSelected: false)
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Article Sélectionné: \(articles.filter { $0.isSelected }.count)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(40)
                    .padding(.bottom, 16)
                    .foregroundColor(Color(hex: "0C8A7B"))

                List {
                    ForEach(articles) { article in
                        ArticleRow(article: article, onDelete: {
                            deletePanierItem(article: article)
                        }, onTap: {
                            toggleSelection(for: article)
                        })
                        .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deletePanierItems)
                }
                .listStyle(PlainListStyle())

                HStack {
                    Text("Méthode de Récupération : ")
                        .font(.headline)

                    Image("voit")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .foregroundColor(isLivraisonSelected ? Color.blue : Color.clear)
                        .background(isLivraisonSelected ? Color.blue.opacity(0.3) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            isLivraisonSelected = true
                        }

                    Spacer()

                    Image(systemName: "building.2.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .foregroundColor(isLivraisonSelected ? Color.gray : Color.blue)
                        .background(isLivraisonSelected ? Color.clear : Color.blue.opacity(0.3))
                        .cornerRadius(8)
                        .onTapGesture {
                            isLivraisonSelected = false
                        }
                }
                .padding(.top, 16)

             /*   NavigationLink(destination: isLivraisonSelected ? AnyView(LivraisonFormView(, isEditing: <#Binding<Bool>#>)) : AnyView(PcListView()), isActive: $showAlert) {
                    EmptyView()
                }
                .hidden()*/

                Button("Valider la commande") {
                    if articles.isEmpty {
                        showAlert = true
                    } else {
                        showAlert = true
                    }
                }
                .buttonStyle(DynamicButtonStyle(color: "0C8A7B", shape: .capsule))
                .foregroundColor(.white)
                .padding(.top, 16)
                /*.alert(isPresented: $showAlert) {
                    Alert(title: Text("Panier Vide"), message: Text("Ajoutez des articles à votre panier avant de valider la commande."), dismissButton: .default(Text("OK")))
                }*/

                Spacer()
            }
            .padding(16)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func deletePanierItem(article: article) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles.remove(at: index)
        }
    }

    private func deletePanierItems(at offsets: IndexSet) {
        let indicesToRemove = offsets.compactMap { articles.index($0, offsetBy: 0, limitedBy: articles.count - 1) }
        articles.remove(atOffsets: IndexSet(indicesToRemove))
    }

    private func toggleSelection(for article: article) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles[index].isSelected.toggle()
        }
    }
}

struct ArticleRow: View {
    let article: article
    var onDelete: () -> Void
    var onTap: () -> Void

    var body: some View {
        VStack {
            Image(systemName: "photo") // Replace with your image
                .resizable()
                .frame(width: 50, height: 50) // Adjust the size as needed

            Text(article.NomArticle)
                .font(.headline)
                .padding(.top, 4)

            Text(article.isSelected ? "Selected" : "Not Selected")
                .font(.caption)
                .foregroundColor(article.isSelected ? Color.green : Color.red)
                .padding(.bottom, 4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .swipeActions {
            Button("Supprimer") {
                onDelete()
            }
            .tint(.red)
        }
        .foregroundColor(Color.black)
        .onTapGesture {
            onTap()
        }
        .rotation3DEffect(
            .degrees(article.isSelected ? 10 : 0),
            axis: (x: 0.5, y: 10.0, z: 0.5)
        )
        .animation(.spring())
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

    struct PanierView_Previews: PreviewProvider {
        static var previews: some View {
            PanierView()
        }
    }
