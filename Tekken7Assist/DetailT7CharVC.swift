//
//  DetailT7CharVC.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/7/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailT7CharVC: UIViewController {
    
    //https://t7api.herokuapp.com/character/miguel?cmd
    
    @IBOutlet weak var moveListTextView: UITextView!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var charImage: UIImageView!
    
    var characters: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updataUI()
    }
    
    func updataUI() {
        guard let character = characters
            else    {
                fatalError()
        }
        
        charNameLabel.text = character.label
        
        CharacterAPI.fetchMovelist(charName: character.name) { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let moveList):
                var moveListText = ""
                for move in moveList    {
                    moveListText += "\(move.moveAttribures)\n\n"
                }
                DispatchQueue.main.async {
                    
                    self?.moveListTextView.text += moveListText
                }
            }
        }
    }
}
