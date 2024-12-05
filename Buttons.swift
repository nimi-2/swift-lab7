//
//  ThemeButton.swift
//  lab2-swift
//
//  Created by student on 29/10/2024.
//

import SwiftUI

struct ThemeButton: View {
    let action: () -> Void
    let label: String
    let icon: String
    let color: Color

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon) // Icon for the button
                    .font(.title)      // Consistent size for icons
                Text(label)            // Label for the button
                    .font(.caption)    // Caption-sized font
            }
            .padding()
            .frame(width: 80, height: 80)
            .background(color.opacity(0.8)) // Background with dynamic theme color
            .foregroundColor(.white)        // Text and icon in white
            .cornerRadius(12)               // Rounded corners
        }
    }
}

// Preview for testing
#Preview {
    ThemeButton(
        action: { print("Button tapped") },
        label: "Animal1",
        icon: "face.smiling",
        color: .purple
    )
}
