//
//  RecipeDetailView.swift
//  Food app
//
//  Created by Luke Davis on 17/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView(){
            
            VStack(alignment: .leading){
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading){
                
                Text("Select Your Serving Size!")
                    .font(.subheadline)
                Picker("", selection: $selectedServingSize){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 160)
               
                }.padding()
                    
                    
                VStack(alignment:.leading){
                
                Text("ingredients")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                    
                    
                    ForEach(recipe.ingredients){ item in
                        Text("•" + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            
                        
                    }
                    Divider()
                }.padding([.leading, .trailing])
                
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
