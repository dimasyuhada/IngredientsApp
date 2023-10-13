//
//  Data.swift
//  Ingredients
//
//  Created by Dimas Syuhada on 13/10/23.
//

import Foundation

struct IngredientsData: Decodable {
    let calories: String
    let carbos: String
    let description: String
    let difficulty: Int
    let fats: String
    let headline: String
    let id: String
    let image: String
    let name: String
    let proteins: String
    let thumb: String
    let time: String
}
