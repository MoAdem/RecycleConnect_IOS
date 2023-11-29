//
//  SignUp.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 30/11/2023.
//

import SwiftUI

enum SignUpViewStack{
    case SignUpUser
    case SignUpOrganisation
}

extension UINavigationController{
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
struct SignUpView: View {

    @State private var presentNextView = false
    @State private var nextView: SignUpViewStack = .SignUpUser
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack(alignment: .leading){
                  
                }
                .frame(width: 400, height: 150)
               
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 270)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(Fonts.darkGreen),
                                        lineWidth: 3)
                        )
                    VStack(alignment: HorizontalAlignment.leading, content: {
                        HStack{
                            Text("Vous etes:")
                                .fontWeight(.medium)
                                .font(.system(size: 18))
                            Text("Client")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                        }
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .offset(x: 60)
                        Button{
                            nextView = .SignUpUser
                            presentNextView.toggle()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 200, height: 40)
                                    .foregroundColor(Fonts.darkGreen)
                                Text("Continuer")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                            }
                        }
                        .padding(.bottom, 10)
                        .padding(.leading, 35)
                    })
                    .padding()
                })
                .padding(.bottom, 15)
                .padding(.top, -20)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 270)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(Fonts.darkGreen),
                                        lineWidth: 3)
                        )
                    VStack(alignment: HorizontalAlignment.leading, content: {
                        HStack{
                            Text("Vous etes : ")
                                .fontWeight(.medium)
                                .font(.system(size: 18))
                            Text("Organisation")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                        }
                        Image("org")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .offset(x: 60)
                        Button{
                            nextView = .SignUpOrganisation
                            presentNextView.toggle()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 200, height: 40)
                                    .foregroundColor(Fonts.darkGreen)
                                Text("Continuer")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                            }
                        }
                        .padding(.bottom, 10)
                        .padding(.leading, 35)
                    })
                    .padding()
                })
                Spacer()
            }
            .background(.white)
            .ignoresSafeArea()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .navigationDestination(isPresented: $presentNextView){
                switch nextView {
                case .SignUpUser:
                    SignUpUser()
                case .SignUpOrganisation:
                    SignUpOrganisation()
                }
                
            }
        }
    }
}

#Preview {
    SignUpView()
}

