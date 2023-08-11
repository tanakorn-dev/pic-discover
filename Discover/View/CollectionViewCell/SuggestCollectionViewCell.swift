//
//  SuggestCollectionViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 24/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core
import Kingfisher
import UseCase

class SuggestCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cardContainerView: UIView!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var ratting: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var distantLabel: UILabel!
    
    let cornerRadius: CGFloat = 10.0
    var forYou: ForYou? {
        didSet {
            if let forYou = self.forYou {
                self.titleLable.text = forYou.title
                self.category.text = forYou.category
                self.distantLabel.text = "\(forYou.price) THB"
//                self.ratting.setIcon(prefixText: "", icon: .icofont(.star), iconColor: .asset(.textGray), postfixText: " \(forYou.ratting)", postfixTextColor: .asset(.textGray), size: nil, iconSize: 14)
                
                let url = URL(string: forYou.image)
                self.profileImage.kf.setImage(with: url)
            } else {
                return
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.cardContainerView.layer.cornerRadius = cornerRadius
        self.cardContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.cardContainerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.cardContainerView.layer.shadowRadius = 5
        self.cardContainerView.layer.shadowOpacity = 0.5

        self.cardImageView.image = UIImage().imageFromColor(color: .white)
        self.cardImageView.layer.cornerRadius = cornerRadius
        self.cardImageView.clipsToBounds = true
        
        self.ratting.custom(.asset(.bold, fontSize: .overline))
        self.titleLable.custom(.asset(.bold, fontSize: .overline))
        self.category.custom(.asset(.regular, fontSize: .overline))
        self.distantLabel.custom(.asset(.bold, fontSize: .overline))
    }

}
