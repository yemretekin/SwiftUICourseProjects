//
//  SettingsView.swift
//  Todo
//
//  Created by Emre Tekin on 6.09.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings()
    
    @State private var isThemeChanged: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0){
                
                Form {
                    
                    Section(header:
                                HStack {
                        Text("Choose the app theme")
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(themes[self.theme.themeSettings].themeColor)
                    }
                    ) {
                        List {
                            ForEach(themes) { theme in
                                
                                Button {
                                    self.theme.themeSettings = theme.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                    self.isThemeChanged.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(theme.themeColor)
                                        
                                        Text(theme.themeName )
                                            .foregroundColor(.black)
                                    }
                                }
                                .accentColor(Color.primary)
                            }
                        }
                        
                    }
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged) {
                        Alert(title: Text("SUCCESS!"), message: Text("App has been changed to the \(themes[self.theme.themeSettings].themeName). Now close and restart it."), dismissButton: .default(Text("OK")))
                    }
                    
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://swiftuimasterclass.com")
                        
                    }
                    
                    
                    Section(header: Text("About the Application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone,iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Emre Tekin")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0")
                    }
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                
                Text("Copyright All rights reserved\nBetter Apps Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            }
            .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
        .accentColor(themes[self.theme.themeSettings].themeColor)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
