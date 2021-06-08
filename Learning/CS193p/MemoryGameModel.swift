//
//  MemoryModel.swift
//  Learning
//
//  Created by Mikael Weiss on 5/1/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card chasen: \(card)")
    }
}

extension MemoryGame {
    struct Card {
        let isFaceUp: Bool
        let isMatched: Bool
        let content: CardContent
    }
}
