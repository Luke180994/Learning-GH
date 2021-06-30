//
//  FeaturedView.swift
//  Food app
//
//  Created by Luke Davis on 29/06/2021.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
       
        GeometryReader(){ geo in
            TabView(){
                
                ForEach (0..<model.recipes.count) { index in
                    
                    if model.recipes[index].featured == true {
                        
                        ZStack(){
                            
                            Rectangle()
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                cornerRadius(17)
                                .shadow(radius: 10)
                            
                            VStack(spacing: 0){
                                
                                Image("lasagna")
                                    .resizable()
                                    .clipped()
                                
                                Text("lasagna")
                                
                            }
                            
                        }
                        
                        
                            
                    }
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        
        
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
