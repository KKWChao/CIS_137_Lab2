//
//  ContentView.swift
//  Lab2
//
//  Created by Kelvin Chao on 10/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameModelView()
    @StateObject private var theme = ThemeModelView()
    
    private let columns = [GridItem(.adaptive(minimum: 90), spacing: 8)]
    
    var body: some View {
        VStack {
            Text("Memory Matching Game")
                .font(.largeTitle)
            
            LazyVGrid(columns: columns) {
                ForEach(game.cards) { cardItem in
                    FlipCard(card: cardItem, theme: "Light")
                        .onTapGesture{
                            game.select(cardItem)
                        }

                }
            }
            
            HStack {
                Button("New Game") {
                    game.start()
                }
            }

        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
