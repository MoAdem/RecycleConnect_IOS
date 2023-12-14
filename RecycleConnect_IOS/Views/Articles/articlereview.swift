//
//  articlereview.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//

import SwiftUI


struct articlereview: View {
    @ObservedObject private var reviewViewModel = ReviewViewModel()
    @State private var newRating: Double = 0
    @State private var newComment: String = "Saisir un nouveau commentaire"
    @State private var isReviewSubmitted: Bool = false
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ForEach(reviewViewModel.reviews, id: \.id) { review in
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(1..<6) { star in
                                Image(systemName: star <= (review.Note) ? "star.fill" : "star")
                                    .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                                    .font(.system(size: 25))
                                    .frame(width: 30, height: 30, alignment: .leading)
                            }
                        }
                        
                        
                        Text(review.Avis)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                    }
                    .padding(.bottom)
                    .contextMenu {
                        Button(action: {
                            reviewViewModel.DeleteReview(reviewId: review.id)
                        }) {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .padding(.top, -80)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                reviewViewModel.GetAllReviews()
            }
            .onChange(of: reviewViewModel.reviews){
                reviewViewModel.GetAllReviews()
            }
        }
        VStack(alignment: .leading) {
            Text("Votre Avis :")
                .font(.headline)
            HStack {
                ForEach(1..<6) { star in
                    Image(systemName: star <= $reviewViewModel.Note ? "star.fill" : "star")
                        .foregroundColor(Color(red: 0.05, green: 0.54, blue: 0.48))
                        .font(.system(size: 25))
                        .frame(width: 35, height: 35)
                        .onTapGesture {
                            newRating = Double(star)
                        }
                }
            }
            TextEditor(text: $reviewViewModel.Avis)
                .padding(5)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 200, alignment: .leading)
            
        }
        .padding()
        Button(action: {
            reviewViewModel.Article="657a504a0bfed04fce065e9a"
            reviewViewModel.CreateReview()
                    }) {
                        Text("Submit Review")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $isReviewSubmitted) {
                        Alert(title: Text("Review Submitted"), message: Text("Your review has been submitted successfully."), dismissButton: .default(Text("OK")))
                    }
                }
                    }


    
#Preview {
    articlereview()
}
