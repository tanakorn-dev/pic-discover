//
//  CategoryTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Core
import UseCase

protocol CategoryTableViewCellDelegate {
    func categoryTableViewCell(_ cell: CategoryTableViewCell, didSelectCategory category: Classification)
    func didSelectMoreCategory()
}

class CategoryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionHeight: NSLayoutConstraint!
    @IBOutlet var linerImage: UIImageView!
    
    let collectionCellRatio: CGSize = CGSize(width: 65.0, height: 80.0)
    let maxItem: Int = 8
    var collectionCellSize: CGSize = CGSize.zero
    var categories: [Classification] = []
    
    var delegate: CategoryTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.linerImage.image = UIImage().imageFromColor(color: .asset(.grayBackground))
        
        self.collectionView.backgroundColor = .clear
        let colorView = UIView()
        colorView.backgroundColor = UIColor.clear
        UICollectionViewCell.appearance().selectedBackgroundView = colorView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: DiscoverNibVars.CollectionViewCell.category, bundle: ConfigBundle.discover), forCellWithReuseIdentifier: DiscoverNibVars.CollectionViewCell.category)
        
        let cellWidth = ((UIScreen.main.bounds.width - 60) / 4)
        let cellHeight = cellWidth * (collectionCellRatio.height / collectionCellRatio.width)
        self.collectionCellSize = CGSize(width: cellWidth, height: cellHeight)
        self.collectionHeight.constant = (self.collectionCellSize.height * 2) + 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withCategories categories: [Classification]) {
        self.categories = categories
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.categories.count > self.maxItem ? self.maxItem : self.categories.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverNibVars.CollectionViewCell.category, for: indexPath as IndexPath) as? CategoryCollectionViewCell
        cell?.backgroundColor = .clear
        
        if self.categories.count > self.maxItem {
            if indexPath.row == (self.maxItem - 1) {
                cell?.category = Classification(text: "More")
            } else {
                cell?.category = self.categories[indexPath.row]
            }
        } else {
            cell?.category = self.categories[indexPath.row]
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.categories.count > self.maxItem {
            if indexPath.row == (self.maxItem - 1) {
                self.delegate?.didSelectMoreCategory()
            } else {
                self.delegate?.categoryTableViewCell(self, didSelectCategory: self.categories[indexPath.row])
            }
        } else {
            self.delegate?.categoryTableViewCell(self, didSelectCategory: self.categories[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.collectionCellSize
    }
    
}
