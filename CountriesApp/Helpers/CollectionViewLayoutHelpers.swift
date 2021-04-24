//
//  CollectionViewLayoutHelpers.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit

func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let itemWidth = width / 3
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets.init(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    
    return flowLayout
}
