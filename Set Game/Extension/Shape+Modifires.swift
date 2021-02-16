//
//  Shape+Modifires.swift
//  Set Game
//
//  Created by Александр Котляров on 08.02.2021.
//

import SwiftUI

extension Shape {
    func stripe(spacing: CGFloat, _ lineWidth: CGFloat = 1) -> some View {
        ZStack {
            StripedRect(spacing: spacing).stroke().clipShape(self)
            self.stroke(lineWidth: lineWidth)
        }
    }
}
