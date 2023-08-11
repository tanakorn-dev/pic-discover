//
//  CategoryCollectionViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Core
import Kingfisher
import UseCase

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var moreImage: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    var category: Classification? {
        didSet {
            guard category != nil else {
                return
            }

            if self.category?.image == "More" {
                self.categoryImage.isHidden = true
                self.moreImage.isHidden = false
//                self.moreImage.image = UIImage.init(icon: .fontAwesomeSolid(.ellipsisH), size: CGSize(width: 40, height: 40), textColor: .asset(.textGray))
            } else {
                self.categoryImage.isHidden = false
                self.moreImage.isHidden = true

                let url = URL(string: self.category?.image ?? "")
                self.categoryImage.kf.setImage(with: url)
            }
            
            self.categoryLabel.text = self.category?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.categoryLabel.custom(.asset(.regular, fontSize: .small))
        self.backgroundImage.circle()
        self.backgroundImage.image = UIImage().imageFromColor(color: .asset(.grayBackground))
    }

}
