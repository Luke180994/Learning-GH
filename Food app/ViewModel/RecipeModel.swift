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
    
    static func getPortion(ingredient:Ingredients, recipeServings:Int, targetServings:Int) -> String {
     
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //get single portion size(* denominator by serving size)
            
            denominator *= recipeServings
            
            //get target portion size(* numerator by target servings)
            
            numerator *= targetServings
            
            // reduce to best fraction
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get whole portions out of the fractions
            
            if numerator >= denominator {
                
                wholePortions = numerator/denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
                
            }
            
            // express the rest as a fraction eg 1 1/2
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                    
                }
                else if unit.suffix(1) == "f"{
                    unit = String (unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
        }

        return portion
        
    }
    
    
    
}
