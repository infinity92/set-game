//
//  ContentView.swift
//  Set Game
//
//  Created by Александр Котляров on 05.02.2021.
//

import SwiftUI

struct ShapeSetGameView: View {
    @ObservedObject var viewModel: ShapeSetGame
    var body: some View {
        GeometryReader { geometry in
            if !viewModel.isWin {
                VStack {
                    HStack {
                        Button(action: {
                            viewModel.resetGame()
                        }){
                            Text("New Game")
                        }
                        Spacer()
                        Text("Cards: \(viewModel.cards.count)")
                        Spacer()
                        Button(action: {
                            viewModel.handOutCards(count: 3)
                        }){
                            Text("Deal 3 More Cards")
                        }.disabled(viewModel.cards.isEmpty)
                    }
                    .padding(.horizontal)
                    
                    Grid(viewModel.cardsOfTable) { card in
                        CardView(card: card)
                            .transition(.offset(randomTransition(size: geometry.size)))
                            .animation( Animation.easeOut(duration: 1.00).delay(delay(by: card)))
                            .onTapGesture {
                            viewModel.choose(card: card)
                        }
                    }.onAppear {
                        viewModel.resetGame()
                    }
                }
                
            
            } else {
                Text("You won!")
            }
        }
    }
    
    private func delay(by card: SetGame<ShapeContent>.Card) -> Double {
        return Double(viewModel.cardsOfTable.firstIndex(matching: card)!) * 0.2
    }
    
    private func randomTransition(size: CGSize) -> CGSize {
        print(size)
        let w = [CGFloat.random(in: -300...0), CGFloat.random(in: size.width...size.width+300)]
        let h = [CGFloat.random(in: -300...0), CGFloat.random(in: size.height...size.height+300)]
        return CGSize(width: w[Int.random(in: 0...1)], height: h[Int.random(in: 0...1)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        Group {
            ShapeSetGameView(viewModel: game)
        }
    }
}
