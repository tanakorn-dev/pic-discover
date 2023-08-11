//
//  WalletTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Core

protocol WalletTableViewCellDelegate {
    func walletTableViewCellDidSelectTopup(_ cell: WalletTableViewCell)
    func walletTableViewCellDidSelectHistory(_ cell: WalletTableViewCell)
    func walletTableViewCellDidSelectCoupon(_ cell: WalletTableViewCell)
}

class WalletTableViewCell: UITableViewCell {

    @IBOutlet var cardContainerView: UIView!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var lineView: UIImageView!
    @IBOutlet var topupImage: UIImageView!
    @IBOutlet var historyImage: UIImageView!
    @IBOutlet var couponImage: UIImageView!
    @IBOutlet var topupLabel: UILabel!
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet var couponLabel: UILabel!
    @IBOutlet var creditLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    var delegate: WalletTableViewCellDelegate?
    let cornerRadius: CGFloat = 10.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardContainerView.layer.cornerRadius = cornerRadius
        self.cardContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.cardContainerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.cardContainerView.layer.shadowRadius = 5
        self.cardContainerView.layer.shadowOpacity = 0.5

        self.cardImageView.layer.cornerRadius = cornerRadius
        self.cardImageView.clipsToBounds = true
        
        self.lineView.image = UIImage().imageFromColor(color: .asset(.darkMain))
        
        self.creditLabel.custom(.asset(.bold, fontSize: .head5))
        self.amountLabel.custom(.asset(.bold, fontSize: .head3), .black)
        self.topupLabel.custom(.asset(.regular, fontSize: .overline))
        self.historyLabel.custom(.asset(.regular, fontSize: .overline))
        self.couponLabel.custom(.asset(.regular, fontSize: .overline))
        
//        self.topupImage.image = UIImage.init(icon: .icofont(.money), size: CGSize(width: 35, height: 30), textColor: .asset(.textGray))
//        self.historyImage.image = UIImage.init(icon: .icofont(.history), size: CGSize(width: 30, height: 30), textColor: .asset(.textGray))
//        self.couponImage.image = UIImage.init(icon: .icofont(.saleDiscount), size: CGSize(width: 30, height: 30), textColor: .asset(.textGray))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func toupAction(_ sender: Any) {
        self.delegate?.walletTableViewCellDidSelectTopup(self)
    }
    
    @IBAction func historyAction(_ sender: Any) {
        self.delegate?.walletTableViewCellDidSelectHistory(self)
    }
    
    @IBAction func couponAction(_ sender: Any) {
        self.delegate?.walletTableViewCellDidSelectCoupon(self)
    }
    
}
