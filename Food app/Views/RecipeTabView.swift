//
//  RecipeTabView.swift
//  Food app
//
//  Created by Luke Davis on 25/06/2021.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
       
        TabView{
            Text("Featured")
                .tabItem {
                VStack {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            RecipeListView()
                .tabItem {
                    VStack(){
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
