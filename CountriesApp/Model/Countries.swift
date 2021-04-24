//
//  Countries.swift
//  CountriesApp
//
//  Created by Nikita Popov on 22.04.2021.
//

import Foundation


struct Country: Codable {
    let name: String
    let capital: String
    let population: Int
    let timezones, borders: [String]
    let region: Region
    let subregion: String
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
    case polar = "Polar"
}
