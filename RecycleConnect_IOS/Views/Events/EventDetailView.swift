import SwiftUI

struct EventDetailView: View {
    let event: Events
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            Image("event1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 180)

            Spacer() // Add Spacer to fill available space

            VStack {
                HStack{
                    Text(event.nameEvent)
                        .font(.custom("Roboto", size: 20).weight(.medium))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Spacer()
                    HStack(spacing : 20){
                        Text("Going:")
                            .font(Font.custom("Roboto", size: 13))
                            .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                            .padding(.top, 0)
        
                        Text("Intrested:")
                            .font(Font.custom("Roboto", size: 13))
                            .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                            .padding(.top, 0)
                        
                    }
                    .padding(.trailing, 40)


                }
                
                HStack {
                    
                    Text("Start Date")
                        .bold()
                        .font(Font.custom("Roboto", size: 13))
                        .padding(.top, 10)

                    Text(event.startEvent)
                        .font(Font.custom("Roboto", size: 13))
                        .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                        .padding(.top, 10)
                    Spacer()
                }
                .padding(.leading)
                
                
                
                VStack{
                    Text("Description")
                      .font(Font.custom("Roboto", size: 20)
                      .weight(.medium))
                      .foregroundColor(.black)
                      .padding(.top, 30)
                    Text(event.descriptionEvent)
                        .bold()
                        .font(Font.custom("Roboto", size: 15    ))
                        .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                        .padding(.top, 10)

                    
                }
                .padding(.leading)
                Spacer()
            }
            

            Spacer()
            HStack{
                Button(action: {
                     print("Interested button tapped")
                 }) {
                     Label("Interested", systemImage: "heart.fill")
                         .font(.custom("Roboto", size: 15).weight(.semibold))
                         .padding(.horizontal, 5)
                         .padding(.vertical, 5)
                         .background(Color.white)
                         .foregroundColor(Color.colorGreen)
                         .cornerRadius(8)
                         .overlay(
                             RoundedRectangle(cornerRadius: 8)
                                 .stroke(Color.colorGreen, lineWidth: 1)
                         )
                 }


                 Button(action: {
                     print("Going button tapped")
                 }) {
                     Label("Going", systemImage: "checkmark.square.fill")
                         .font(.custom("Roboto", size: 15).weight(.semibold))
                         .padding(.horizontal, 5)
                         .padding(.vertical, 5)
                         .background(Color.white)
                         .foregroundColor(Color.colorGreen)
                         .cornerRadius(8)
                         .overlay(
                             RoundedRectangle(cornerRadius: 8)
                                 .stroke(Color.colorGreen, lineWidth: 1)
                         )
                 }
            }
            .padding(.bottom, 20)

        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
                    XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: MockData.sampleEvent, isShowingDetailView: .constant(true))
    }
}
