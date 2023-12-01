import SwiftUI

enum ViewStack {
    case ResetPassword
    case SignUp
}

struct SignInView: View {
    @StateObject var userViewModel = UserViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showHomePage = false

    @State private var presentNextView = false
    @State private var nextView: ViewStack = .SignUp
    @State private var isAppTabViewPresented: Bool = false
      @State private var isResetPasswordPresented: Bool = false
    
    var body: some View {
        VStack {
            Image("login")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom, 50)
                .padding(.top ,100)
            TextField("", text: $username, prompt: Text("Nom").foregroundColor(Color.gray))
                .disableAutocorrection(true)
                .frame(width: 300, height: 40)
                .padding(.leading, 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom,20)
                .padding(.top, 20)
                .background(Image("profile").resizable().scaledToFit().frame(
                    width: 25, height:25).padding(.leading, 30), alignment: .leading)
            
            SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(Color.gray))
                .disableAutocorrection(true)
                .frame(width: 300, height: 40)
                .padding(.leading, 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(Fonts.darkGreen),
                                lineWidth: 1.5)
                )
            
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom,20)
                .padding(.top, 13)
                .background(Image("pass").resizable().scaledToFit().frame(
                    width: 25, height:40).padding(.leading, 30), alignment: .leading)
                .padding(.bottom, 18)
       
            Button(action: {

                userViewModel.loginUser(username: username, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("Login successful for user: \(user)")
                        showAlert = true
                        alertMessage = "Login successful"
                    case .failure(let error):
                        print("Login failed with error: \(error)")
                        showAlert = true
                        alertMessage = "Login failed: \(error.localizedDescription)"                    }
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 340, height: 40)
                        .foregroundColor(Fonts.darkGreen)
                    Text("Se connecter")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                }
                .alert(isPresented: $showAlert) {
                           Alert(title: Text("Login Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                       }
                   }
            }
            .padding(.bottom, 30)
                                           
                      HStack(alignment: .center) {
                          Text("Pas de compte ?")
                              .foregroundColor(Color.black)
                              .fontWeight(.regular)
                              .font(.system(size: 18))
                          
                          Button(action: {
                                             nextView = .SignUp
                                             presentNextView = true
                                         }) {
                                             Text("Créer un compte")
                                                 .foregroundColor(Color(Fonts.darkGreen))
                                                 .fontWeight(.semibold)
                                                 .font(.system(size: 18))
                                         }
                                     }
                                     .padding(.bottom, 12)
                                    Button(action: {
                                                isResetPasswordPresented.toggle()
                                               }) {
                                             Text("Mot de passe oublié ?")
                                            .foregroundColor(Color(Fonts.darkGreen))
                                            .fontWeight(.semibold)
                                            .font(.system(size: 18))
                                                                               
                                               }.sheet(isPresented: $isResetPasswordPresented) {
                                                                                     ResetPassword()
                                                                                   Spacer()
                                                                               }
                                                                               .background(Color.white)
                                                                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                                               .ignoresSafeArea()
                                                                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                                               .fullScreenCover(isPresented: $presentNextView) {
                                                                                   if nextView == .SignUp {
                                                                                       SignUpView()
                                                                                   }else if nextView == .ResetPassword {
                                                                                       ResetPassword()
                                                                                   }                                 }
                                                                           }
                                                                       }

                                                  
                                              #Preview {
                                                  SignInView()
                                              }
