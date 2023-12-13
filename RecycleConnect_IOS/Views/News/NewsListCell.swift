//
//  NewsListCell.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

struct NewsListCell: View {
    
    let news: News
    
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: news.newsPhoto)) { phase in
                switch phase{
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200) // Adjust as needed
                case .failure:
                    Image("event1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                    
                @unknown default:
                    EmptyView()
                }
            }
                
                
            VStack(alignment: .leading) {
                Text(news.title)
                    .font(.custom("Roboto", size: 20).weight(.medium))
                    .padding(.top, 10)
                Spacer()

            Text(news.description)
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                    .frame(width: 303, alignment: .topLeading)
                    .padding(.top, 10)
                Spacer()
                
            }
        }
    }

}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

