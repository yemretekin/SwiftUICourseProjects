//
//  ContentView.swift
//  SwiftUILink
//
//  Created by Emre Tekin on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Link(destination: URL(string: "https://apple.com")!) {
            VStack {
                HStack {
                    Image(systemName: "apple.logo")
                    Text("Apple Store")
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(
                    Capsule()
                        .fill(Color.blue))
                HStack {
                    Text("iOS")
                        .font(.system(size: 180))
                        .fontWeight(.black)
                        .foregroundStyle(LinearGradient(colors: [.pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
