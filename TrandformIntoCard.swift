//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 03/12/2024.
//


import SwiftUI

struct TransformIntoCard: ViewModifier {
    var isFaceUp: Bool
    var color: Color = .purple
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base
                .fill(.white)
                .stroke(color, lineWidth: 2)
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            
            base.fill()
                
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
        .animation(.easeInOut(duration: 2), value: isFaceUp)
    }
}

//extension View {
//    func transformIntoCard(isFaceUp: Bool) -> some View{
//        self.modifier(TransformIntoCard(isFaceUp: isFaceUp))
//    }
//}
