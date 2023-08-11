//
//  FooterTableViewCell.swift
//  chiiwii-customer
//
//  Created by Tanakorn Phoochaliaw on 24/9/2562 BE.
//  Copyright © 2562 Tanakorn Phoochaliaw. All rights reserved.
//

import UIKit
import Core

class FooterTableViewCell: UITableViewCell {

    @IBOutlet var updatedLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.updatedLabel.custom(.asset(.regular, fontSize: .small))
        self.companyLabel.custom(.asset(.regular, fontSize: .small))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
