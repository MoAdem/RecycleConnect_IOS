import SwiftUI

struct ReservationView: View {
    let imageURL = URL(string: "https://example.com/path/to/your/image.jpg")!
    let buttonColor = Color(hex: "0C8A7B")
    let buttonTextColor = Color.white

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
                                .foregroundColor(buttonColor) // Text color to match the button color

                            Text("Description de l'article")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)
                                .padding(.top, 8)
                                .foregroundColor(.gray) // Adjust text color

                            TextEditor(text: .constant("Ajouter un commentaire"))
                                .frame(width: 300, height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(buttonColor, lineWidth: 2) // Border color matching the button color
                                )
                                .padding([.horizontal, .top], 16)

                            NavigationLink(destination: PanierView()) {
                                Text("Ajouter au panier")
                                    .foregroundColor(buttonTextColor)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(buttonColor))
                                    .cornerRadius(20)
                                    .padding(16)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding()
                    )
                    .padding([.horizontal, .top], 16)

                Spacer()
            }
            .background(Color.gray.edgesIgnoringSafeArea(.all))
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
