//
//  MoveList.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
struct MoveList: Decodable  {
    
    let cmd: String
    let hit: String
    let dmg: String
    let speed: String
    let onBlock: String
    let onHit: String
    let onCounter: String
    let notes: String
    
    var moveAttribures: String  {
        let moveDetails =
        """
        Cmd: \(self.cmd)
        Hit: \(self.hit)
        Dmg: \(self.dmg)
        Speed: \(self.speed)
        On Block: \(self.onBlock)
        On Hit: \(self.onHit)
        On Counter: \(self.onCounter)
        Notes: \(self.notes)
        """
        return moveDetails
    }
}
