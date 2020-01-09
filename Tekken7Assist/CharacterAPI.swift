//
//  CharacterAPI.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/6/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

class CharacterAPI  {
    
    static func fetchCharacters(completion: @escaping (Result<[Character], AppError>) -> ())   {
        let endpointURL = "https://t7api.herokuapp.com/character/list"
        
        guard let url = URL(string: endpointURL)    else    {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do  {
                    let character = try JSONDecoder().decode([Character].self, from: data)
                    completion(.success(character))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    static func fetchMovelist(charName: String, completion: @escaping (Result<[MoveList], AppError>) -> ()) {
        let endpointURL = "https://t7api.herokuapp.com/character/\(charName)?cmd"
        
        guard let url = URL(string: endpointURL)
            else    {
                completion(.failure(.badURL(endpointURL)))
                return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do  {
                    let moveList = try JSONDecoder().decode([MoveList].self, from: data)
                    
                    completion(.success(moveList))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
}
