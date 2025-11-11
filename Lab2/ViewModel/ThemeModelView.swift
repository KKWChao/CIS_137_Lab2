//
//  ThemeModelView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

import SwiftUI

final class ThemeModelView: ObservableObject {
    let themeData = Bundle.main.decode([Theme].self, from: "ThemeData.json")
    
    @Published var cardTheme: Theme = Theme(id:"32a01986-1dbe-4b1b-81ad-7e32a06a4c2a",name:"Smiley", emoji: ["😀","😂","🥶","🤓","🥳","😡"], colorRed: 1.00, colorGreen: 0.00, colorBlue: 0.00)
    
    func switchTheme() {
        cardTheme = themeData.randomElement() ?? cardTheme
    }
}
