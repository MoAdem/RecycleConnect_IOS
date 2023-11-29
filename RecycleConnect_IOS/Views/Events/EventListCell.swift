//
//  EventListCell.swift
//  OrogEvents
//
//  Created by Med adem Torkhani   on 27/11/2023.
//

import SwiftUI

struct EventListCell: View {
    
    let event: Events
    
    var body: some View {
        VStack(spacing: 0) {
            Image("event1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200) // Adjust as needed
            HStack(alignment: .top) {
                Text(event.nameEvent)
                    .font(.custom("Roboto", size: 20).weight(.medium))
                    .padding(.top, 10)
                Spacer()
                Text(event.startEvent)
                    .font(Font.custom("Roboto", size: 13))
                    .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                    .padding(.top, 10)
            }
            Text(event.descriptionEvent)
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                    .frame(width: 303, alignment: .topLeading)
                    .padding(.top, 10)
                Spacer()
        }
    }
}

struct EventListCell_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
