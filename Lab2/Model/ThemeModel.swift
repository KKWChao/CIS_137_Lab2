//
//  ThemeModel.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

/*
 * Lab 3
 * No Group
 * Kelvin Chao
 * 11/10/2026
 */


import SwiftUICore

struct Theme: Codable, Identifiable {
    var id: String
    var name: String
    var emoji: [String]
    var colorRed: Double
    var colorGreen: Double
    var colorBlue: Double
}
