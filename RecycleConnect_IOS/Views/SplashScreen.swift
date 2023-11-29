

import SwiftUI

struct Splashscreen: View {
    
    @State private var isActive = false
    @State private var size = 0.3
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            SignInView()
        } else {
            VStack {
                ZStack {
                    Image("")
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear(){
                            withAnimation(.easeIn(duration: 1.2)){
                                self.size = 0.6
                                self.opacity = 1.0
                            }
                        }
                }
            
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color.white)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation(.linear){
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    Splashscreen()
}
