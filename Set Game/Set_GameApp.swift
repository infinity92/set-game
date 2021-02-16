//
//  Set_GameApp.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import SwiftUI

@main
struct Set_GameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = ShapeSetGame()
            ShapeSetGameView(viewModel: game)
        }
    }
}
