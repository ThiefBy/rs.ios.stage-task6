//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minTrump: Value? = nil
        var firstPlayer: Player? = nil
        
        for player in players {
            for card in player.hand ?? [] {
                if card.isTrump && (minTrump == nil || card.value.rawValue < minTrump!.rawValue) {
                    minTrump = card.value
                    firstPlayer = player
                }
            }
        }
        
        return firstPlayer
    }
}
