//
//  Player.swift
//  Mastermind Game
//
//  Created by kin ming ching on 7/12/2021.
//

import Foundation
class Player : NSObject {
    var name : String
    init(name : String) {
        self.name = name;
    }
}
class PlayerManager: NSObject{
    private var players = [Player]()
    func appendNote(expense : Player){
        players.append(expense)
    }
    func count() -> Int {
        return players.count;
    }
    func player(at index : Int) -> Player {
        return players[index];
    }
    
}
