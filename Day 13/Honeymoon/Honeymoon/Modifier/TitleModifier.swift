//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Emre Tekin on 6.09.2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
