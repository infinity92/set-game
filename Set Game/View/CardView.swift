//
//  Card.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import SwiftUI

struct CardView: View {
    var card: SetGame<ShapeContent>.Card
    var borderColor: Color {
        if card.isNotMatch {
            return .red
        } else if card.isMatch {
            return .green
        } else if card.isSelected {
            return .blue
        } else {
            return .orange
        }
    }
    
    var body: some View {
        
        VStack {
            card.content
                .padding()
        }
        .cardify(isFaceUp: true)
        .foregroundColor(borderColor)
        .padding(5)
    }
}

