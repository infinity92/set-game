//
//  StripedRect.swift
//  Set Game
//
//  Created by Александр Котляров on 06.02.2021.
//

import SwiftUI

struct StripedRect: Shape {
    var spacing: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.minY)
        
        var path = Path()
        path.move(to: start)
        while path.currentPoint!.x < rect.maxX {
            path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.maxY))
            path.move(to: CGPoint(x: path.currentPoint!.x + spacing, y: rect.minY))
        }
        return path
    }
}
