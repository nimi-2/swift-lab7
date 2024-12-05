import SwiftUI
import Foundation

class MemoGameModelView: ObservableObject{
    
    var themeColor = Color.purple
    
    
    @Published var model = createMemoGame()
    var cards: Array<MemoGameModel<String>.Cards> { model.cards}
    var mainCard : MemoGameModel<String>.Cards{model.mainCard!}

    private static let themes: [Color: [String]] = [
        Color.purple: ["👻","🐹","🦥","🦦","🐋","🐆","🦩"," 🦔 "],
        Color.cyan:["🐎","🐿️","🐉","🐣","🦚","🦨","🦫","🐇"],
        Color.gray:["🐕","🦭","🦇","🦮","🦢","🦌","🦘","🐅"]
        ]
    var themeNumber = 1
    
    func choose(_ card: MemoGameModel<String>.Cards){
        model.choose(cards: card)
    }
    init() {
        changeTheme(color: .purple)
       }
    
    private static func createMemoGame(color: Color = .purple) -> MemoGameModel<String>{
            guard let pairCount = themes[color]?.count else{
                fatalError("404")
            }
            
        return MemoGameModel<String>(numberOfCards: pairCount){
            index in
            if let themestab = themes[color], themestab.indices.contains(index){
                return themestab[index]
            }else{
                return "505"
            }
        }
    }
    
    func changeTheme(color: Color) {

        themeColor = color
        model = MemoGameModelView.createMemoGame(color: color)
    }

    func shuffleCards() {
        model.shuffle()
        
    }
}
