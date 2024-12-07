//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI
import Foundation

struct CardView: View {
    let card: MemoGameModel<String>.Cards
    var color: Color = .purple
    
    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .fill(color)
            .opacity(20)        
            .overlay(
                Text(card.content)
                    
                    .font(.system(size: 200))
                    
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    .aspectRatio(1, contentMode: .fit)
                .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                
                    .animation(card.isMatched ? .spin(duration: 2) : default, value: card.isMatched)
            )
            
            .padding(20)
            .modifier(TransformIntoCard(isFaceUp: card.isFaceUp,color: color))
            .opacity(card.visible ? 1 : 0)
        
        
        
    }
    
//    var body: some View {
//        ZStack {
//            let base = RoundedRectangle(cornerRadius: 12)
//            Group {
//                base.fill(.white)
//                base.stroke(color, lineWidth: 2)
//
//                Text(card.content)
//                    .font(.system(size: 200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(contentMode: .fit)
//            }
//            .opacity(card.isFaceUp ? 1 : 0)
//            base.fill(color).opacity(card.isFaceUp ? 0 : 1)
//        }
//        .opacity(card.visible ? 1:0)
//
//    }

}


#Preview {
    CardView(card: MemoGameModel<String>.Cards(id:"", content: "🦥", isFaceUp: true, isMatched: false))
}
