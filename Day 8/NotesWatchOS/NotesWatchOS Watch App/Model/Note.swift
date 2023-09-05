//
//  Note.swift
//  NotesWatchOS Watch App
//
//  Created by Emre Tekin on 4.09.2023.
//

import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
