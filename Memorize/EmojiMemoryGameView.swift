//
//  EmojiMemoryGameView.swift
//  Memorize
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
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
      @ViewBuilder
       private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
        ZStack{
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding().opacity(0.3)
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
            
    //MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
        
    }
}






struct EmojiMemoryGameView_Previews: PreviewProvider {

    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[4])
        return EmojiMemoryGameView(viewModel: game)
    }
}
    
  
    
    



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            
            
            
    }
}

