//
//  AccountDetailsTableViewCell.swift
//  ITAU_POC
//
//  Created by Parag on 25/11/19.
//  Copyright © 2019 Parag. All rights reserved.
//

import Foundation
import UIKit

public class AccountDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var accountDetailsView: UIView!
    @IBOutlet weak var lblTrasactionDate: UILabel!
    @IBOutlet weak var lblTitleLabel: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAmountDetails: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
