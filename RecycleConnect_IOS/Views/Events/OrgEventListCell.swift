//
//  OrgEventListCell.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 6/12/2023.
//

import SwiftUI

struct OrgEventListCell: View {
    let event: Events
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: event.PhotoEvent)) { phase in
                switch phase{
                case .empty:
                    Image("event1")
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 100, maxHeight: 200)
                        .cornerRadius(3)
                case .failure:
                    Image("event1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                    
                @unknown default:
                    EmptyView()
                }
            
            }
            VStack(alignment: .leading){
                Text(event.nameEvent)
                    .font(.custom("Roboto", size: 20).weight(.medium))
                    .padding(.leading, 15)
                    .padding(.top,0)
                Text(event.startEvent)
                    .font(Font.custom("Roboto", size: 13))
                    .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                    .padding(.leading, 15)
            }

        }
        
    }
}

struct OrgEventListCell_Previews: PreviewProvider {
    static var previews: some View {
        OrgEventsView()
    }
}
