//
//  ThemeModelView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

import SwiftUI

final class ThemeModelView: ObservableObject {
    @Published var cardTheme: Theme = Theme(name: "Animals", emoji: ["🐱","🐶","🐻","🐼","🐵","🐸"], bgColor: Color.orange)
    
    
    func switchTheme(to newTheme: Theme) {
        cardTheme = newTheme
    }
}
