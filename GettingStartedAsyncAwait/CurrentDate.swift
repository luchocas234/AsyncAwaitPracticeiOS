//
//  CurrentDate.swift
//  GettingStartedAsyncAwait
//
//  Created by u633168 on 02/02/2023.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
