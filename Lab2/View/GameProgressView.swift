//
//  GameProgressView.swift
//  Lab2
//
//  Created by Kelvin Chao on 11/11/25.
//

/*
 * Homework 13
 * No Group
 * Kelvin Chao
 * 11/11/2026
 */

import SwiftUI

struct GameProgressView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            // not sure how to use withAnimation?
//            withAnimation(.linear(duration: 0.25)) {
//                ProgressView("Progress", value: gameViewModel.progress)
//            }
            ProgressView("Progress", value:  gameViewModel.progress)
                .animation(.bouncy(duration: 0.75))
                .tint(gameViewModel.progress == 1 ? Color.green : Color.red)
            
        }

    }
}
