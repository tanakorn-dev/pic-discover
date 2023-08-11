//
//  GreetingTableViewCell.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Core
import SwiftDate

class GreetingTableViewCell: UITableViewCell {

    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var greeting: String? {
        didSet {
            if let greeting = self.greeting {
                self.greetingLabel.text = "\(greeting) สุชาติ ใจดี"
            } else {
                return
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.greetingLabel.custom(.asset(.bold, fontSize: .head2))
        self.dateLabel.custom(.asset(.regular, fontSize: .head4), .asset(.textLightGray))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
