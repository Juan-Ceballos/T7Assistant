//
//  Characters.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/6/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

struct Character: Decodable    {
    let name: String
    let label: String
    var charName: String    {
        var characterName = self.label.lowercased().replacingOccurrences(of: " ", with: "-")
        
        if characterName == "geese"
        {characterName = "geese-howard"}
        
        return characterName
    }
}
