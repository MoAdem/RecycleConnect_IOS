//
//  CategorieViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 2/12/2023.
//

import Foundation

class CategorieViewModel: ObservableObject {
    @Published var categories: [categorie] = []

    func GetAllCategories() {
        CategorieServices.shared.GetAllCategories { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                }
            case .failure(let error):
                print("Error fetching categories: \(error.localizedDescription)")
            }
        }
    }


}
