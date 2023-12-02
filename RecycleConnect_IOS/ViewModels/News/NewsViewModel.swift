//
//  EventViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI

final class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var alertItem: AlertItem?
    @Published var isLoding = false
    @Published var isShowingDetailView = false
    @Published var selectedNews: News?

    
    func getNews() {
        isLoding = true
        NewsServices.shared.getNews { [self] result in
            DispatchQueue.main.async {
                isLoding = false
                switch result {
                case .success(let news):
                    self.news = news
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
