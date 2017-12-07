//
//  Concentration.swift
//  Concentration
//
//  Created by Matija Sabljak on 07/12/2017.
//  Copyright © 2017 Globaldizajn. All rights reserved.
//

import Foundation

// reference type

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
            } else {
//                // either no cards or 2 cards are face up
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }

    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards): you must have at least one pair of cards")
        // countable range
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            
//            let matchingCard = card
//            cards.append(matchingCard)
            
            cards.append(card)
            cards.append(card)

        }
        //TODO : Shuffle the cards
        var last = cards.count - 1
        while last > 0
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            cards.swapAt(last, rand)
            last -= 1
        }
        
    }
}
