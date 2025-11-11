//
//  ContentView.swift
//  Lab2
//
//  Created by Kelvin Chao on 10/7/25.
//

/*
 * Lab 3
 * No Group
 * Kelvin Chao
 * 11/10/2026
 */


import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameViewModel()
    @StateObject private var themeViewModel = ThemeViewModel()
    
    private let columns = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Text("Memory Matching Game")
                .font(.title)
                .bold(true)
                .foregroundStyle(Color(red:themeViewModel.cardTheme.colorRed, green:themeViewModel.cardTheme.colorGreen, blue:themeViewModel.cardTheme.colorBlue))
            
            Spacer()
            
            GameProgressView(gameViewModel: game)
            
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
                }.padding().buttonStyle(.borderedProminent)

                Button("Switch Theme") {
                    themeViewModel.switchTheme()
                    game.start()
                }.padding().buttonStyle(.borderedProminent)
            }

        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
