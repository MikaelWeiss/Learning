//
//  MemoryViewModel.swift
//  Learning
//
//  Created by Mikael Weiss on 5/1/21.
//

import SwiftUI

class EmojiMemoryViewModel {
    private var model: MemoryGame<String> = MemoryGame<String>(cards: .init())
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
