//
//  RecipeModel.swift
//  Food app
//
//  Created by Luke Davis on 14/06/2021.
//

import Foundation


class RecipeModel : ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        self.recipes = Dataservice.getLocalData()
        
        
    }
    
}
