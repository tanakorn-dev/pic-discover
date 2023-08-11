//
//  SuggestTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 23/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core
import UseCase

protocol SuggestTableViewCellDelegate {
    func suggestTableViewCell(_ cell: SuggestTableViewCell)
}

class SuggestTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    var delegate: SuggestTableViewCellDelegate?
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    var forYou: [ForYou] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.backgroundColor = UIColor.clear
        let colorView = UIView()
        colorView.backgroundColor = UIColor.clear
        UICollectionViewCell.appearance().selectedBackgroundView = colorView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: DiscoverNibVars.CollectionViewCell.suggest, bundle: ConfigBundle.discover), forCellWithReuseIdentifier: DiscoverNibVars.CollectionViewCell.suggest)
        
        self.titleLabel.custom(.asset(.bold, fontSize: .head4))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withForYou forYou: [ForYou], title: String) {
        self.titleLabel.text = title
        self.forYou = forYou
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.forYou.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverNibVars.CollectionViewCell.suggest, for: indexPath as IndexPath) as? SuggestCollectionViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.forYou = self.forYou[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.suggestTableViewCell(self)
    }
}
