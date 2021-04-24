//
//  RegionCollectionViewCell.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit

class RegionCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "reuseID"
    
    var imageView = UIImageView(frame: .zero)
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .black
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 25, right: 0))
        
        addSubview(textLabel)
        textLabel.backgroundColor = .clear
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        
        textLabel.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: imageView.trailingAnchor)
    }
    
}

// MARK: - RegionCollectionViewCell "isSelected" extension

extension RegionCollectionViewCell {
    override var isSelected: Bool {
       didSet{
           if self.isSelected {
               UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor(red: 115/255, green: 190/255, blue: 170/255, alpha: 1.0)
                self.textLabel.textColor = .white
               }
           }
           else {
               UIView.animate(withDuration: 0.3) {
                self.backgroundColor = .clear
                self.textLabel.textColor = .black
               }
           }
       }
   }
    
}
