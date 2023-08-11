//
//  AdsTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Kingfisher
import UseCase

class AdsTableViewCell: UITableViewCell {

    @IBOutlet var adsImage: UIImageView!
    
    let cornerRadius: CGFloat = 10.0
    
    var ads: Ads? {
        didSet {
            if let ads = self.ads {
                let url = URL(string: ads.image)
                self.adsImage.kf.setImage(with: url)
            } else {
                return
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
