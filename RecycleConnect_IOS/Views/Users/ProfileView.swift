//
//  ProfileView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 30/11/2023.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var viewModel = UserViewModel()
    var user: User
    @State private var isEditing = false

    var body: some View {
        NavigationView{
            
       
            VStack(alignment: .leading, spacing: 15) {
                VStack {
                    if let loggedInUsername = viewModel.loggedInUsername,
                       let loggedInUserEmail = viewModel.loggedInUserEmail {
                        Text("Username: \(loggedInUsername)")
                        Text("Email: \(loggedInUserEmail)")
                        
                    } else {
                        ProgressView()
                            .onAppear {
                                if let loggedInUserID = viewModel.loggedInUserID {
                                    viewModel.fetchUser(_id: loggedInUserID)
                                }
                            }
                    }
                }
                .padding()
                /*   NavigationLink(destination: Text("Change profile")) {
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
                 .buttonStyle(PlainButtonStyle())*/
                
                /*   NavigationLink(destination: Text("Delivery Address Page")) {
                 Text("Adresse livraison")
                 .font(.headline)
                 .padding()
                 .frame(maxWidth: .infinity)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
                 }*/
                NavigationLink(destination: DetailsLivListView()) {
                    Text("Details Livraison")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .background(Image("delivery").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                .buttonStyle(PlainButtonStyle())
                
                /* NavigationLink(destination: LivraisonFormView(isEditing: $isEditing)) {
                 Text("Go to Formulaire")
                 .font(.headline)
                 .padding()
                 .frame(maxWidth: .infinity)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
                 }
                 .background(Image("delivery").resizable().scaledToFit().frame(
                 width: 25, height:25).padding(.leading, 20), alignment: .leading)
                 .buttonStyle(PlainButtonStyle())
                 NavigationLink(destination: ReservationPcListView()) {
                 Text("Go to Reservation pc")
                 .font(.headline)
                 .padding()
                 .frame(maxWidth: .infinity)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
                 }
                 .background(Image("delivery").resizable().scaledToFit().frame(
                 width: 25, height:25).padding(.leading, 20), alignment: .leading)
                 .buttonStyle(PlainButtonStyle())*/
                
                
                NavigationLink(destination: ReservationPcListView()) {
                    Text("Details Reservation point collecte")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                .background(Image("delivery").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                .buttonStyle(PlainButtonStyle())
                .background(Image("delivery").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                .buttonStyle(PlainButtonStyle())

                NavigationLink(destination: AddEventView()) {
                    Text("Add Events")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Image("support").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                NavigationLink(destination: OrgEventsView()) {
                    Text("My Events")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Image("support").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                /*  NavigationLink(destination: Text("Support Center Page")) {
                 Text("Centre Support ")
                 .font(.headline)
                 .padding()
                 .frame(maxWidth: .infinity)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
                 }
                 .buttonStyle(PlainButtonStyle())
                 .background(Image("support").resizable().scaledToFit().frame(
                 width: 25, height:25).padding(.leading, 20), alignment: .leading)*/
                
                NavigationLink(destination: SignInView()) {
                    Text("Se déconnecter")
                        .font(.headline)
                        .padding()
                    
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }     .background(Image("legal").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 20), alignment: .leading)
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 20)
                
            }
                                             }
                   }
}


#Preview {
    ProfileView(user: User(_id: "", username: "", email: "", address: "", password: "", telephone: 5658742, role: "", __v: 0))
}

