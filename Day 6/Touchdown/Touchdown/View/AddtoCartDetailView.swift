//
//  AddtoCartDetailView.swift
//  Touchdown
//
//  Created by Emre Tekin on 31.08.2023.
//

import SwiftUI

struct AddtoCartDetailView: View {
    
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        Button {
            feedback.impactOccurred()
        } label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
            Color(red: shop.selectedProduct?.red ?? sampleProduct.red, green:
                    shop.selectedProduct?.green ?? sampleProduct.green, blue:
                    shop.selectedProduct?.blue ?? sampleProduct.blue)
        )
        .clipShape(Capsule())
    }
}

struct AddtoCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddtoCartDetailView()
            .environmentObject(Shop())
    }
}
