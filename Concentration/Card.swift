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

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
