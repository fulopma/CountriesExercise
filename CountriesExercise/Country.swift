//
//  Country.swift
//  CountriesExercise
//
//  Created by Marcell Fulop on 7/2/25.
//

import Foundation

struct Country: Decodable {
    let name: String
    let code: String
    let capital: String
    let region: String
}
