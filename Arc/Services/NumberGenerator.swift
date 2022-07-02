//
//  NumberGenerator.swift
//  Arc
//
//  Created by Dave Agyakwa on 22/04/2022.
//

import Foundation


struct ACRandomGenerator {
    static func generateNumber(length: Int = 7) -> Int {
        let letters = "0123456789"
        return Int(String((0...length).map{ _ in letters.randomElement()!}))!
    }
}
