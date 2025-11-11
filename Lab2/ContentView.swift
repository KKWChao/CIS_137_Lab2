//
//  ContentView.swift
//  Lab2
//
//  Created by Kelvin Chao on 10/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameModelView()
    @StateObject private var themeViewModel = ThemeModelView()
    
    private let columns = [GridItem(.adaptive(minimum: 100), spacing: 8)]
    
    var body: some View {
        VStack {
            Text("Memory Matching Game")
                .font(.largeTitle)
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(game.cards) { cardItem in
                    FlipCard(card: cardItem, themeViewModel: themeViewModel)
                        .onTapGesture{
                            game.select(cardItem)
                        }

                }
            }
            Spacer()
            
            HStack {
                Button("New Game") {
                    game.start()
                }.padding()
                Spacer()
                Button("Switch Theme") {
                    themeViewModel.switchTheme()
                    game.start()
                }.padding()
            }

        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
