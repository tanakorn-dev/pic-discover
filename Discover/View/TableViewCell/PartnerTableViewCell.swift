//
//  PartnerTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 24/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core
import UseCase

protocol PartnerTableViewCellDelegate {
    func partnerTableViewCell(_ cell: PartnerTableViewCell, didSelectCategory category: Classification)
}

class PartnerTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var linerImage: UIImageView!
    
    var delegate: PartnerTableViewCellDelegate?
    var partner: [Partner] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.collectionView.backgroundColor = UIColor.clear
               let colorView = UIView()
               colorView.backgroundColor = UIColor.clear
               UICollectionViewCell.appearance().selectedBackgroundView = colorView
               self.collectionView.dataSource = self
               self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: DiscoverNibVars.CollectionViewCell.partner, bundle: ConfigBundle.discover), forCellWithReuseIdentifier: DiscoverNibVars.CollectionViewCell.partner)
        
        self.titleLabel.custom(.asset(.bold, fontSize: .head4))
        self.linerImage.image = UIImage().imageFromColor(color: .asset(.grayBackground))
    }
    
    func configure(withPartner partner: [Partner], title: String) {
        self.titleLabel.text = title
        self.partner = partner
        self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.partner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverNibVars.CollectionViewCell.partner, for: indexPath as IndexPath) as? PartnerCollectionViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.partner = self.partner[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
            
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.partnerTableViewCell(self, didSelectCategory: Classification(name: ""))
    }
    
}
