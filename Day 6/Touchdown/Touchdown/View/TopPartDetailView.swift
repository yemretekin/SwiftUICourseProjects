//
//  TopPartDetaiView.swift
//  Touchdown
//
//  Created by Emre Tekin on 31.08.2023.
//

import SwiftUI

struct TopPartDetailView: View {
    
    @EnvironmentObject var shop : Shop
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        HStack (alignment: .center, spacing: 6, content: {
            VStack(alignment:.leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            })
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            
            Image(shop.selectedProduct?.image ?? sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0: -35)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.75)) {
                        isAnimating.toggle()
                    }
                }
        })
    }
}

struct TopPartDetaiView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
