import SwiftUI
import Foundation
struct MemoGameModel<CardContent : Equatable>{
    private(set) var cards: Array<Cards>
    private(set) var mainCard: Cards?  = nil
    
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        let mainCardNumber = Int.random(in: 0..<numberOfCards)
        for index in 0..<max(2, numberOfCards){
            let content = cardContentFactory(index)
            cards.append(Cards(id: "\(index)_a", content: content))
            if (mainCardNumber == index){
                self.mainCard = Cards(id: "\(index)_b", content: content, isFaceUp: true)
            }
            
            
        }
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    
    private func indexOfFaceUp(cards: Cards) -> Int?{
        for index in self.cards.indices {
            if self.cards[index].isFaceUp{
                if self.cards[index].id != cards.id{
                    return index
                }
            }
        }
        return nil
    }
    
    mutating func choose(cards: Cards) {
        if let faceUpIndex = indexOfFaceUp(cards: cards){
            self.cards[faceUpIndex].isFaceUp = false
        }
        
        if let cardIndex = index(of: cards){
            self.cards[cardIndex].isFaceUp.toggle()
            
            if self.cards[cardIndex].content == mainCard!.content{
                
                self.cards[cardIndex].isMatched = true
                
                for index in self.cards.indices {
                    
                    if !self.cards[index].isMatched {
                       
                        self.cards[index].visible = false
                        mainCard?.isMatched = true
                    }
                }
            }
        }
        
    }
    
    private func index(of cards: Cards) -> Int?{
        for index in self.cards.indices {
            if(self.cards[index].id == cards.id){
                return index
            }
        }
        return nil
    }
    
    
    
    struct Cards : Equatable, Identifiable{
        var id: String
        var content: CardContent
        var isFaceUp = false
        var isMatched = false
        var visible = true
    }
}
