//
//  UserViewModel.swift
//  RecycleConnect_IOS
//
//  Created by Hanine Bouguerra on 28/11/2023.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func getAllUsers(){
        UserServices.shared.getAllUsers { result in
            switch result{
            case .success(let users):
                self.users = users
                print("Successfully fetched users : \(users)")
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    
    
    
    
    

}




