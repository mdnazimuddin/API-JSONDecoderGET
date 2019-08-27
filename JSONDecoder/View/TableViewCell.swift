//
//  TableViewCell.swift
//  JSONDecoder
//
//  Created by Nazim Uddin on 27/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    var data:JsonModel!{
        didSet{
            lbl1.text = "Name: \(data.name)"
            lbl2.text = "Capital: \(data.capital)"
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
