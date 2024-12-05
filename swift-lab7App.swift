//
//  labidkApp.swift
//  labidk
//
//  Created by student on 26/11/2024.
//

import SwiftUI

@main
struct swift-lab7App: App {
    @StateObject var game = MemoGameModelView() // Use StateObject for ViewModel

        var body: some Scene {
            WindowGroup {
                ContentView(viewModel: game) // Pass ViewModel to ContentView
            }
        }
}
