//
//  MemoryApp.swift
//  Memory
//
//  Created by Sergey Antoniuk on 1/6/21.
//

import SwiftUI

@main
struct MemoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
