//
//  RecipeDetailView.swift
//  Food app
//
//  Created by Luke Davis on 17/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView(){
            
            VStack(alignment: .leading){
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment:.leading){
                
                Text("ingredients")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                    
                    
                    ForEach(recipe.ingredients, id:\.self){ item in
                        Text("•" + item)
                            
                        
                    }
                    Divider()
                }.padding([.leading,.trailing])
                
                VStack(alignment:.leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id:\.self){index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }.padding([.leading,.trailing])
                
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
