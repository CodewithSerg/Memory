//
//  ContentView.swift
//  Memory
//
//  Created by Sergey Antoniuk on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.padding(5)
            }
        
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            
            if card.isFaceUp {
                
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
                
            } else {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill()
                
                
            }
        }
        .font(Font.system(size: min(geometry.size.height, geometry.size.width)*0.8))
        }
    }
}
