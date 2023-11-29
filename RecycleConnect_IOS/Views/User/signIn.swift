import SwiftUI

enum ViewStack {
    case homepage
    case signup
}

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var showHomePage = false
    @State private var navigateToHomePage = false
    @State private var presentNextView = false
    @State private var nextView: ViewStack = .signup
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
            Button{
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 340 , height: 40)
                        .foregroundColor(Fonts.darkGreen)
                    Text("Se connecter")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                }
            }
            .padding(.bottom, 30)
            
            // Sign up button
            HStack(alignment: .center, content:
                    {
                Text("Pas du compte ?")
                    .foregroundStyle(Color.black)
                    .fontWeight(.regular)
                    .font(.system(size: 18))
                Button{
                    nextView = .signup
                    presentNextView.toggle()                } label: {
                        Text("Créer un compte")
                            .foregroundStyle(Color(Fonts.darkGreen))
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                    }
                
            })
            .padding(.bottom, 12)
            
            Spacer()
            
            ZStack{
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 300, height: 150)
            .offset(y: -10)
            
        
            
        }
        .background(.white)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .fullScreenCover(isPresented: $showHomePage, content: TestView.init)
        
    }}

#Preview {
    SignInView()
}
