//
//  FeatureTabView.swift
//  Touchdown
//
//  Created by Emre Tekin on 29.08.2023.
//

import SwiftUI

struct FeatureTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedTabView()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct FeatureTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
        
    }
}
