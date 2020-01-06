//
//  CharaceterCell.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/6/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class CharaceterCell: UITableViewCell    {
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func configureCell(imageURL: String, character: Character)    {
        characterImage.getImage(with: imageURL) { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let charImage):
                DispatchQueue.main.async {
                    self?.characterImage.image = charImage
                }
            }
        }
        characterName.text = character.label
    }
    
}
