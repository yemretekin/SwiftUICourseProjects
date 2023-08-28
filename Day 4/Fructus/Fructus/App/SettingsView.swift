//
//  SettingsView.swift
//  Fructus
//
//  Created by Emre Tekin on 28.08.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                                ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat.")
                                .font(.footnote)
                        }
                    }
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
                            Divider().padding(.vertical, 4)
                            
                            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarding) {
                                if isOnboarding {
                                    Text("Restarted".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.green)
                                } else {
                                    Text("Restart".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.secondary)
                                }
                            }
                            .padding()
                            .background(Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        }
                    
                    
                    
                    GroupBox(label:SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
                        
                        
                        SetttingsRowView(name: "Developer", content: "John / Jane")
                        SetttingsRowView(name: "Designer", content: "Robert Petras")
                        SetttingsRowView(name: "Compatibility", content: "iOS 14")
                        SetttingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SetttingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                        SetttingsRowView(name: "SwiftUI", content: "2.0")
                        SetttingsRowView(name: "Version", content: "1.1.0")
                        
                    }
                    
                    
                    
                    
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
                .padding()
            )}
        
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
