//
//  PartnerCollectionViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 24/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core
import Kingfisher
import UseCase

class PartnerCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var partnerImage: UIImageView!
    
    var partner: Partner? {
        didSet {
            if let partner = self.partner {
                self.titleLabel.text = partner.name
                
                let url = URL(string: partner.image)
                self.partnerImage.kf.setImage(with: url)
            } else {
                return
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.titleLabel.custom(.asset(.regular, fontSize: .small))
//        self.partnerImage.circle(.asset(.grayBackground))
    }

}
