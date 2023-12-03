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
                    print("voici la liste des categories du viewmodel",categories)
                }
            case .failure(let error):
                print("Error fetching categories: \(error.localizedDescription)")
            }
        }
    }

    func createCategorie(NomCategorie: String, NbreTotalArticles: Int) {
        CategorieServices.shared.CreateCategorie(NomCategorie: NomCategorie, NbreTotalArticles: NbreTotalArticles) { result in
            switch result {
            case .success(let nouvCategorie):
                print("New category created: \(nouvCategorie)")
                // You may want to update the list of categories after creating a new one
                self.GetAllCategories()
            case .failure(let error):
                print("Error creating category: \(error.localizedDescription)")
            }
        }
    }
}

