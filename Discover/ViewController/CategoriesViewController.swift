//
//  CategoriesViewController.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 24/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core
import PanModal
import UseCase

protocol CategoriesViewControllerDelegate {
    func categoriesViewController(_ view: CategoriesViewController, didSelectCategory category: Classification)
}

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var categories: [Classification] = []
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    let collectionCellRatio: CGSize = CGSize(width: 65.0, height: 80.0)
    var collectionCellSize: CGSize = CGSize.zero
    
    var delegate: CategoriesViewControllerDelegate?
    var viewHeight: CGFloat = 0
    var maxHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.custom(.asset(.bold, fontSize: .head4))
        
        self.collectionView.backgroundColor = UIColor.clear
        let colorView = UIView()
        colorView.backgroundColor = UIColor.clear
        UICollectionViewCell.appearance().selectedBackgroundView = colorView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: DiscoverNibVars.CollectionViewCell.category, bundle: ConfigBundle.discover), forCellWithReuseIdentifier: DiscoverNibVars.CollectionViewCell.category)
        
        let cellWidth = ((UIScreen.main.bounds.width - 60) / 4)
        let cellHeight = cellWidth * (collectionCellRatio.height / collectionCellRatio.width)
        self.collectionCellSize = CGSize(width: cellWidth, height: cellHeight)
        
        if (self.categories.count % 4) == 0 {
            self.viewHeight = (CGFloat(self.categories.count / 4) * cellHeight)
        } else {
            self.viewHeight = (CGFloat(Int(self.categories.count / 4) + 1) * cellHeight)
        }
        
        self.maxHeight = (UIScreen.main.bounds.height - (self.viewHeight + 40)) - 100
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverNibVars.CollectionViewCell.category, for: indexPath as IndexPath) as? CategoryCollectionViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.category = self.categories[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        self.delegate?.categoriesViewController(self, didSelectCategory: self.categories[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.collectionCellSize
    }
}

extension CategoriesViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(self.maxHeight)
    }

    var anchorModalToLongForm: Bool {
        return false
    }
}
