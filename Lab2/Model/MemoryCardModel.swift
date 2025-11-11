//
//  Model.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

/*
 * REUSE FROM PRIOR GROUP
 * Lab 3
 * No Group
 * Kelvin Chao
 * 11/10/2026
 */


import SwiftUI

struct MemoryCard : Codable, Identifiable, Equatable {
    var id = UUID()
    var value: Int
    var isFlipped: Bool = false
    var isMatched: Bool = false
}

