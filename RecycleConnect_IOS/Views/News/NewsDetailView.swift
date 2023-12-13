//
//  NewsDetailView.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

struct NewsDetailView: View {
    let news: News
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: news.newsPhoto)) { phase in
                switch phase{
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 180) // Adjust as needed
                case .failure:
                    Image("event1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 180)
                    
                @unknown default:
                    EmptyView()
                }
            }

            Spacer() // Add Spacer to fill available space

            VStack (alignment: .leading){
                HStack{
                    Text(news.title)
                        .font(.custom("Roboto", size: 20).weight(.medium))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack {
                    
                    Text("Source:")
                        .bold()
                        .font(Font.custom("Roboto", size: 18))
                        .padding(.top, 10)

                    Text(news.source)
                        .font(Font.custom("Roboto", size: 18))
                        .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                        .padding(.top, 10)
                    Spacer()
                }
                .padding()
                
                
                
                VStack(alignment: .leading) { // Set alignment to leading
                    Text("Description")
                        .font(Font.custom("Roboto", size: 20).weight(.medium))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                        .padding(.leading)

                    Text(news.description)
                        .bold()
                        .font(Font.custom("Roboto", size: 15))
                        .foregroundColor(Color(red: 0.51, green: 0.54, blue: 0.54))
                        .padding(.top, 5)
                        .padding(.leading)
                    Spacer() // Add Spacer to fill available space
                }

            }
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

struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: MockDataNews.sampleNews, isShowingDetailView: .constant(true))
    }
}
