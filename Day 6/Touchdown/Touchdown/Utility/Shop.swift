//
//  Shop.swift
//  Touchdown
//
//  Created by Emre Tekin on 31.08.2023.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
