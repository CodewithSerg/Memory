//
//  MemoryGame.swift
//  Memory
//
//  Created by Sergey Antoniuk on 1/6/21.
//

import Foundation

struct MemoryGame<Content> {
    
    var cards: Array<Card>
    
    mutating func choose(card: Card)  {
        print ("You choose \(card)")
        let chosenIndex: Int! = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card)-> Int? {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairs: Int, contentFactory: (Int)-> Content) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: Content
        var id: Int
        
    }
}
