//
//  Regions.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit

struct RegionsHeader {
    let regionImage: UIImage
    let regionName: String
}

let regions = [
    RegionsHeader(regionImage: UIImage(named: "Mercator_projection_SW")!, regionName: "All"),
    RegionsHeader(regionImage: UIImage(named: "Africa_(orthographic_projection)")!, regionName: "Africa"),
    RegionsHeader(regionImage: UIImage(named: "Americas_(orthographic_projection)")!, regionName: "Americas"),
    RegionsHeader(regionImage: UIImage(named: "Asia_(orthographic_projection)")!, regionName: "Asia"),
    RegionsHeader(regionImage: UIImage(named: "Europe_orthographic_Caucasus_Urals_boundary")!, regionName: "Europe"),
    RegionsHeader(regionImage: UIImage(named: "480px-Oceania_(orthographic_projection).svg")!, regionName: "Oceania")
]
