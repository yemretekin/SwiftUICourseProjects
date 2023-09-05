//
//  ContentView.swift
//  Avocados
//
//  Created by Emre Tekin on 4.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var headers: [Header] = headersData
    var facts : [Fact] = factsData
    var recipe: [Recipe] = recipesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0 ) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                        
                    }
                }
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                
                DishesView()
                    .frame(maxWidth: 650)
                
                
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 61) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipe) { fact in
                        RecipeCardView(recipe: fact)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                
                
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avacados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData, facts: factsData, recipe: recipesData)
    }
}
