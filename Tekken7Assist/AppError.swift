//
//  App Error.swift
//  Tekken7Assist
//
//  Created by Juan Ceballos on 1/5/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

enum AppError: Error{
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case badStatusCode(Int)
    case badMimeType(String)
    
}

