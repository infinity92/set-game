//
//  ContentCard.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import SwiftUI

struct ShapeContent: View, SetableCardContent {
    var count: Int
    var color: Color
    var type: ShapeSetGame.ShapeList
    var shade: ShapeSetGame.Shading
    
    var body: some View {
        VStack {
            ForEach ( 0..<count ) { index in
                getShape()
                    .aspectRatio(3/2, contentMode: .fit)
            }
                
        }
    }
    
     //TODO: - Need to fix logic
    static func isSet(card contents: [ShapeContent]) -> Bool{
        guard contents.count == 3 else { return false }
        if (contents[0].count == contents[1].count && contents[1].count == contents[2].count) ||
            (contents[0].count != contents[1].count && contents[0].count != contents[2].count && contents[1].count != contents[2].count) {
            return true
        } else if (contents[0].color == contents[1].color && contents[1].color == contents[2].color) ||
                    (contents[0].color != contents[1].color && contents[0].color != contents[2].color && contents[1].color != contents[2].color) {
            return true
        } else if (contents[0].type == contents[1].type && contents[1].type == contents[2].type) ||
                    (contents[0].type != contents[1].type && contents[0].type != contents[2].type && contents[1].type != contents[2].type) {
            return true
        } else if (contents[0].shade == contents[1].shade && contents[1].shade == contents[2].shade) ||
                    (contents[0].shade != contents[1].shade && contents[0].shade != contents[2].shade && contents[1].shade != contents[2].shade) {
            return true
        }
        
         return false
    }
    
    
    @ViewBuilder
    private func getShape() -> some View {
        switch type {
            case .oval:
                shading(shape: Capsule())
            case .diamond:
                shading(shape: Diamond())
            case .squiggle:
                shading(shape: Squiggle())
        }
    }
    
    @ViewBuilder
    private func shading<someShape>(shape: someShape) -> some View where someShape: Shape {
        switch shade {
            case .open:
                shape.stroke().fill(color)
            case .solid:
                shape.fill(color)
            case .striped:
                shape.stripe(spacing: 5).foregroundColor(color)
        }
    }
}


