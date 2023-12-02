//
//  NewsListView.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI



struct NewsListView: View {
    
    @StateObject var newsViewModel = NewsViewModel()
    @State private var isShowingDetailView = false
    @State private var searchTerm = ""
    
    var filteredNews: [News] {
        guard !searchTerm.isEmpty else {return newsViewModel.news}
        return newsViewModel.news.filter { $0.title.localizedStandardContains(searchTerm)}
    }
        
    var body: some View {
        ZStack{
            NavigationView {
                List(filteredNews, id: \._id) { news in
                    NewsListCell(news: news)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("News")
                .listStyle(.plain)
                .searchable(text: $searchTerm, prompt: "search News")
            }
            .onAppear() {
                newsViewModel.getNews()
            }
            /*
            .blur(radius: isShowingDetailView ? 20 : 0)
            if isShowingDetailView {
                EventDetailView(event: MockData.sampleEvent, isShowingDetailView: $isShowingDetailView)
            }
             */
            if newsViewModel.isLoding{
                LodingView()
            }

            
        }
        .alert(item: $newsViewModel.alertItem) { alertitem in
            Alert(title: alertitem.title,message: alertitem.message, dismissButton: alertitem.dismissButton)
        }

    }

}

#if DEBUG
struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
#endif
