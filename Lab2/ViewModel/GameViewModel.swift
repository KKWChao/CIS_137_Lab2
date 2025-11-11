//
//  ModelView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

/*
 * REUSED FROM PRIOR GROUP
 * Lab 3
 * No Group
 * Kelvin Chao
 * 11/10/2026
 */

import Foundation

final class GameViewModel: ObservableObject {
    @Published private(set) var cards: [MemoryCard] = []
    @Published var progress: Float = 0

    private var indexFlippedCard: Int?
    private var totalMatched: Int = 0
    
    init() {
        start();
    }
    
    func start() {
        var pairs: [MemoryCard] = []
        indexFlippedCard = nil
        resetScore()
        for i in 0..<6 {
            pairs.append(MemoryCard(value: i))
            pairs.append(MemoryCard(value: i))
        }
        
        cards = pairs.shuffled()
    }
    
    func select(_ card: MemoryCard) {
        guard let chosenIndex = cards.firstIndex(of: card),
              !cards[chosenIndex].isFlipped,
              !cards[chosenIndex].isMatched else { return }
        
        
        if let potentialCheck = indexFlippedCard {
            cards[chosenIndex].isFlipped = true

            if cards[potentialCheck].value == cards[chosenIndex].value {
                // Both cards match — mark them as permanently matched.
                cards[potentialCheck].isMatched = true
                cards[chosenIndex].isMatched = true
                
                updateScore()
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                guard let self = self else { return }
                if !self.cards[potentialCheck].isMatched {
                    self.cards[potentialCheck].isFlipped = false
                }
                if !self.cards[chosenIndex].isMatched {
                    self.cards[chosenIndex].isFlipped = false
                }
                
                // Reset the single face-up tracker for the next turn.
                self.indexFlippedCard = nil
            }
        
        } else {
            for i in cards.indices { cards[i].isFlipped = false }

            // Then flip the selected card face-up.
            cards[chosenIndex].isFlipped = true

            // Record its index as the one and only face-up card.
            indexFlippedCard = chosenIndex
        }
        
    }
    
    func updateScore() {
        totalMatched += 1
        progress = Float(totalMatched)/6.0
    }
    
    func resetScore() {
        totalMatched = 0
        progress = 0
    }

}
