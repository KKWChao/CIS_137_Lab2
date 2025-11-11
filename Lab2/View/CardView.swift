//
//  CardView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/8/25.
//

import SwiftUI

/// ------------------------------------------------------------
/// CARDVIEW – DOUBLE SIDED  CARD DESIGN
///
/// This subview defines how each individual card looks.
/// It changes appearance based on its state:
///  - Face-up → shows emoji content
///  - Face-down → shows a question mark icon
///  - Matched → light green background
/// ------------------------------------------------------------

// MARK: - Front Card
/// Front card showing the question square
struct FrontCardView: View {
    let card: MemoryCard
    @ObservedObject var theme: ThemeModelView
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                // Color depends on whether the card is matched or still in play.
                .fill(theme.cardTheme.bgColor)

            // Outline border around the card for visual separation.
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
            
            Image(systemName: "questionmark.circle.dashed")
                .font(.system(size: 100))
        }
        .padding(4)
    }
}

// MARK: - Back Card
/// Back of the card showing the emoji
/// changes color if isMatch is true
struct BackCardView: View {
    let card: MemoryCard
    @ObservedObject var theme: ThemeModelView
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                // Color depends on whether the card is matched or still in play.
                
                .fill(card.isMatched
                      ? Color.green.opacity(0.25)
                      : theme.cardTheme.bgColor.opacity(0.55))

            // Outline border around the card for visual separation.
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                
            
            Text(theme.cardTheme.emoji[card.value]) // need to fix this, convert int into theme
                .font(.system(size: 80))

        }
        .padding(4)
    }
}


// MARK: - Flip Card
/// Logic for flipping the card
/// Will remain flipped based on the status of isMatched
struct FlipCard: View {
    let card: MemoryCard
    @ObservedObject var themeViewModel: ThemeModelView
    
    var body: some View {
        ZStack {
            if card.isFlipped || card.isMatched {
                BackCardView(card: card, theme: themeViewModel)
                    .rotation3DEffect(.degrees(180), axis: (x: -1, y: 0, z: 0))
            } else {
                FrontCardView(card: card, theme: themeViewModel)
            }
        }
        .rotation3DEffect(.degrees((card.isFlipped || card.isMatched) ? 180 : 0 ), axis: (x: 1, y: 0, z: 0))
        .animation(.easeInOut(duration: 0.3), value: card.isFlipped || card.isMatched)
    }
}
