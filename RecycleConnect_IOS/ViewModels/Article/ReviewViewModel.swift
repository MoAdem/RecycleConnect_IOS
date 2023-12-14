//
//  ReviewViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 14/12/2023.
//

import Foundation
import SwiftUI

class ReviewViewModel: ObservableObject {
    @Published var reviews: [review] = []
    @Published var review: review?
    
        @Published var id: String = ""
        @Published var Note: Int = 0
        @Published var Avis: String = ""
        @Published var Article: String = ""




    func GetAllReviews() {
        ReviewServices.shared.GetAllReviews{ result in
            switch result {
            case .success(let reviews):
                DispatchQueue.main.async {
                    self.reviews = reviews
                }
            case .failure(let error):
                print("Error fetching reviews: \(error.localizedDescription)")
            }
        }
    }

    
    
    func DeleteReview(reviewId: String) {
        ReviewServices.shared.DeleteReview(reviewId: reviewId) { result in
                switch result {
                case .success:
                    print("review supprimé")
                case .failure(let error):
                   print("erreur de suppression: \(error)")
                }
            }
        }


    
    func CreateReview() {
        ReviewServices.shared.CreateReview(
                note: Note, avis: Avis, articleId: Article)
             { result in
                switch result {
                case .success(let review):
                    print("Review created: \(review)")
                case .failure(let error):
                    print("Error creating review: \(error)")
                }
            }
        }
    

    

    
}


