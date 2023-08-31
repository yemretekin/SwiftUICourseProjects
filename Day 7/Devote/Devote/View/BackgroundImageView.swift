//
//  BackgroundImage.swift
//  Devote
//
//  Created by Emre Tekin on 31.08.2023.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
