//
//  Diamond.swift
//  Set Game
//
//  Created by Александр Котляров on 06.02.2021.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.midY)
        
        var path = Path()
        path.move(to: start)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: start)

        return path
    }
}
