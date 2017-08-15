//
//  AmountTableViewCell.swift
//  GST
//
//  Created by Rubiya on 12/08/17.
//  Copyright © 2017 Rubiya. All rights reserved.
//

import UIKit

class AmountTableViewCell: UITableViewCell {

    @IBOutlet var amountLabel: UITextField?
    
    @IBOutlet weak var txtAmount: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GstRateTableViewCell: UITableViewCell {
    
    @IBOutlet var gstRateLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class GoodsPriceTableViewCell: UITableViewCell {
    
    @IBOutlet var goodPriceLabe: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
class GstTAxTableViewCell: UITableViewCell {
    
    @IBOutlet var gstTaxLabe: UILabel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
class TotalBillTableViewCell: UITableViewCell {
    
    @IBOutlet var totalBillLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
