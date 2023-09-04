//
//  FactModel.swift
//  Avocados
//
//  Created by Emre Tekin on 4.09.2023.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
