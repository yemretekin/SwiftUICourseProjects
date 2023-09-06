//
//  ThemeSettings.swift
//  Todo
//
//  Created by Emre Tekin on 6.09.2023.
//

import SwiftUI

final public class ThemeSettings: ObservableObject {
  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
    
    init() {}
  public static let shared = ThemeSettings()
}
