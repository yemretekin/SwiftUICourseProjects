//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Emre Tekin on 31.08.2023.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetLiveActivity()
    }
}
