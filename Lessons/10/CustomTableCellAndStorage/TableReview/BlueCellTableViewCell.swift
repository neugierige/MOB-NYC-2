//
//  BlueCellTableViewCell.swift
//  TableReview
//
//  Created by Arun Nagarajan on 3/17/15.
//  Copyright (c) 2015 Arun Nagarajan. All rights reserved.
//

import UIKit

class BlueCellTableViewCell: UITableViewCell {

    @IBOutlet weak var textValue: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
