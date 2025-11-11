//
//  ThemeModelView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

import SwiftUI

final class ThemeModelView: ObservableObject {
    @Published var cardTheme: Theme = Theme(name: "Animals", emoji: ["🐱","🐶","🐻","🐼","🐵","🐸"], bgColor: Color.blue)
    
    func switchTheme() {
        let cardThemes: [Theme] = [
            Theme(name:"Smiley", emoji: ["😀","😂","🥶","🤓","🥳","😡"], bgColor:Color.red ),
            Theme(name: "Items", emoji: ["🐱","🐶","🐻","🐼","🐵","🐸"], bgColor: Color.blue),
            Theme(name: "Food", emoji: ["🍎","🍔","🍕","🍗","🍜","🍞"], bgColor: Color.yellow)
        ]
        
        
        
        cardTheme = cardThemes.randomElement() ?? cardTheme
    }
}
