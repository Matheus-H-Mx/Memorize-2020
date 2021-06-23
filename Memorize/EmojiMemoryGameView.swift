//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Matheus Henrique on 12/05/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
                Cardview(card: card).onTapGesture {
                self.viewModel.choose(card: card)
                }
                .padding(3)
        }
                .padding()
                .foregroundColor(Color.red)
   }
 }

struct Cardview: View {
    var card:MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
      
       private func body(for size: CGSize) -> some View {
            ZStack {
                if card.isFaceUp {
                RoundedRectangle(cornerRadius:cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius:cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                    RoundedRectangle(cornerRadius:cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: size)))
        }
    
    
    //MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth:CGFloat = 3
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}
    
    
  
    
    



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            
            
            
    }
}

