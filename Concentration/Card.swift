//
//  Card.swift
//  Concentration
//
//  Created by Matija Sabljak on 07/12/2017.
//  Copyright © 2017 Globaldizajn. All rights reserved.
//

import Foundation

// no inheritance
// Value type like Int, String, Double

struct Card: Hashable {
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
