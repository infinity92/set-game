//
//  SetGame.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import Foundation

struct SetGame<CardContent> where CardContent:SetableCardContent {
    
    var cards:Array<Card>
    var cardsOnTable: Array<Card> = []
    var choseCards: Array<Card> = []
    var totalCards: Int
    var isWin: Bool {
        cards.count <= 0 && cardsOnTable.count <= 0
    }
    
    init (totalCards: Int, firstDeal: Int, cardContentFactory: (Int) -> CardContent) {
        self.totalCards = totalCards
        cards = Array<Card>()
        for index in 0..<totalCards {
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: index+1))
        }
        cards.shuffle()
//        handOutCards(firstDeal)
    }
    
    mutating func handOutCards(_ count: Int) {
        if CardContent.isSet(card: choseCards.map { $0.content }) {
            updateCardsOnTable()
        } else {
            if count <= cards.count {
                for _ in 0..<count {
                    cardsOnTable.append(cards.removeLast())
                }
            }
        }
    }
    
    mutating func replaceOrRemoveCardOnTable(at index: Int) {
        cardsOnTable.remove(at: index)
        if cards.count > 0 {
            cardsOnTable.insert(cards.removeLast(), at: index)
        }
    }
    
    mutating func updateCardsOnTable() {
        for card in choseCards {
            if let index = cardsOnTable.firstIndex(matching: card) {
                if cardsOnTable[index].isMatch {
                    replaceOrRemoveCardOnTable(at: index)
                }
                cardsOnTable[index].isMatch = false
                cardsOnTable[index].isSelected = false
                cardsOnTable[index].isNotMatch = false
            }
        }
        choseCards.removeAll()
    }
    
    mutating func choose(card: Card) {
        if let index = cardsOnTable.firstIndex(matching: card) {
            if choseCards.count == 3 {
                updateCardsOnTable()
            }
            if let index = choseCards.firstIndex(matching: card) {
                choseCards.remove(at: index)
            } else {
                choseCards.append(card)
            }
            cardsOnTable[index].isSelected.toggle()
            
            
            if choseCards.count == 3 {
                if CardContent.isSet(card: choseCards.map { $0.content }) {
                    for card in choseCards {
                        if let index = cardsOnTable.firstIndex(matching: card) {
                            cardsOnTable[index].isMatch = true
                        }
                    }
                } else {
                    for card in choseCards {
                        if let index = cardsOnTable.firstIndex(matching: card) {
                            cardsOnTable[index].isNotMatch = true
                        }
                    }
                }
                cardsOnTable[index].isSelected = false
            }
        }
       
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatch = false
        var isNotMatch = false
        var isSelected = false
        var content: CardContent
        var id: Int
        
    }
}
