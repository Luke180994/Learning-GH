//
//  DataService.swift
//  Food app
//
//  Created by Luke Davis on 14/06/2021.
//

import Foundation


class Dataservice {
    
   static func getLocalData() -> [Recipe] {
        
        //Parse local data file from json
        
        // get a URL path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check pathstring is not nil otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // decode the json file with decoder
            let decoder = JSONDecoder()
            
            do{
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add unique ID
                for r in recipeData{
                    r.id = UUID()
                    
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
                
                // return the data to recipes
                return recipeData
            }
            catch{
                
                //error with passing json
                print(error)
            }
            
            
        }
        catch{
            //error with getting data
            print(error)
        }
    return [Recipe]()

    }
    
}
