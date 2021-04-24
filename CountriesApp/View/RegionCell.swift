//
//  RegionCell.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit


class RegionCell: UITableViewCell {
    
    static let reuseId = "regionCellID"
    var collectionView: UICollectionView!
    var callback : ((String) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: createThreeColumnFlowLayout(in: contentView))
        contentView.addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(RegionCollectionViewCell.self, forCellWithReuseIdentifier: RegionCollectionViewCell.reuseId)
    }
}

extension RegionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegionCollectionViewCell.reuseId, for: indexPath) as! RegionCollectionViewCell
        let region = regions[indexPath.item]
        cell.imageView.image = region.regionImage
        cell.textLabel.text = region.regionName
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            cell.isSelected = true
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let regionName = regions[indexPath.item].regionName.lowercased()
        callback?(regionName)
    }
}
