//
//  ShapeSetGame.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import SwiftUI

class ShapeSetGame: ObservableObject {
    @Published private var model: SetGame<ShapeContent> = ShapeSetGame.createSetGame()
    
    private static var colors: [Color] {
        return [
            Color.red,
            Color.green,
            Color.purple
        ]
    }
    
    static var firstDeal: Int {
        12
    }
    
    static func createSetGame() -> SetGame<ShapeContent> {
        var allVariantsCards: Array<ShapeContent> = []
        for count in 1...3 {
            for color in colors {
                for type in ShapeList.allCases {
                    for shade in Shading.allCases {
                        allVariantsCards.append(ShapeContent(count: count, color: color, type: type, shade: shade))
                    }
                }
            }
        }
        return SetGame(totalCards: allVariantsCards.count, firstDeal: firstDeal) { index in
            return allVariantsCards[index]
        }
    }
    
    func choose(card: SetGame<ShapeContent>.Card) {
        model.choose(card: card)
    }
    
    var cards: Array<SetGame<ShapeContent>.Card> {
        model.cards
    }
    
    var isWin: Bool {
        model.isWin
    }
    
    var cardsOfTable: Array<SetGame<ShapeContent>.Card> {
        return model.cardsOnTable
    }
    
    func handOutCards(count: Int) {
        model.handOutCards(count)
    }
    
    func resetGame() {
        model = ShapeSetGame.createSetGame()
        handOutCards(count: 12)
    }
    
    enum ShapeList: CaseIterable {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading: CaseIterable {
        case solid
        case striped
        case open
    }
}
