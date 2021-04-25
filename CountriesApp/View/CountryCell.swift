//
//  CountryCell.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit

class CountryCell: UITableViewCell {
    
    static let reuseId = "CountryCellID"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        accessoryType = .disclosureIndicator
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
