//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Sergey Antoniuk on 1/6/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame()->MemoryGame<String>{
        
        let emoji: Array<String> = ["👻","🐫","⛄️"]
        
        return MemoryGame<String>(numberOfPairs: emoji.count){ pairIndex in
            return emoji[pairIndex] }
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    func choose(card: MemoryGame<String>.Card)  {
        model.choose(card: card)
    }
}
