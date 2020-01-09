//
//  T7CharacterVC.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/5/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class T7CharacterVC: UIViewController {
    
    @IBOutlet weak var charSearchBar: UISearchBar!
    @IBOutlet weak var charTableView: UITableView!
    
    var characters = [Character]()   {
        didSet  {
            DispatchQueue.main.async {
                self.charTableView.reloadData()
            }
        }
    }
    
    var searchQuery: String = ""    {
        didSet  {
            CharacterAPI.fetchCharacters { [weak self] (result) in
                switch result   {
                case .failure(let appError):
                    print(appError)
                case .success(let character):
                    self?.characters = character.filter{($0.label.lowercased().contains(String(self?.searchQuery ?? "").lowercased()) )}
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charTableView.dataSource = self
        charTableView.delegate = self
        charSearchBar.delegate = self
        loadData()
    }
    
    func loadData() {
        CharacterAPI.fetchCharacters { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let character):
                self?.characters = character
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailT7CharVC = segue.destination as? DetailT7CharVC, let indexPath = charTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let character = characters[indexPath.row]
        detailT7CharVC.characters = character
    }
    
}

extension T7CharacterVC: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = charTableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharaceterCell
            
            else    {
                fatalError()
        }
        
        let character = characters[indexPath.row]
        
        cell.configureCell(imageURL: "https://media.eventhubs.com/images/tekken7/character_header_\(character.charName)_alt.jpg", character: character)
        
        return cell
    }
}

extension T7CharacterVC: UITableViewDelegate    {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension T7CharacterVC: UISearchBarDelegate    {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        charSearchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty   else    {
            loadData()
            return
        }
        
        searchQuery = searchText
    }
}
