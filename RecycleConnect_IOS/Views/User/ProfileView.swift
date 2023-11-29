import SwiftUI


struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("admin")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hanine bouguerra")
                        .font(.title)
                        .bold()
                    
                    Text("bouguerra.hanine@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 30)

            NavigationLink(destination: Text("Change profile")) {
                Text("Changer profile")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(Fonts.black))
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .background(Image("pro").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 20), alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: Text("Order History Page")) {
                Text("Méthodes de paiement")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .background(Image("payment").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 20), alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: Text("Delivery Address Page")) {
                Text("Adresse livraison")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .background(Image("delivery").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 20), alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: Text("Support Center Page")) {
                Text("Centre Support ")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            .background(Image("support").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 20), alignment: .leading)
            NavigationLink(destination: Text("Legal Policy Page")) {
                Text("Legal Policy")
                    .font(.headline)
                    .padding()
                
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }     .background(Image("legal").resizable().scaledToFit().frame(
                width: 25, height:25).padding(.leading, 20), alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 20)

            Button(action: {
                                //action button 
                                         }) {
                                            HStack {
                                                 Text("Se déconnecter")
                                                     .foregroundColor(Color(Fonts.darkGreen))
                                                     .fontWeight(.semibold)
                                                     .font(.system(size: 18))
                                                 
                                                     .background(Image("log").resizable().scaledToFit().frame(
                                                         width: 25, height:25).padding(.leading, 140), alignment: .leading)
                                            }
                                         }
                                         .padding()
                                         .frame(maxWidth: .infinity)
                                         .cornerRadius(8)
                                         .buttonStyle(PlainButtonStyle())
                   }
               }
           }


#Preview {
    ProfileView()
}
