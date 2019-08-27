//
//  DetailsViewController.swift
//  JSONDecoder
//
//  Created by Nazim Uddin on 27/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    var name:String!
    var alpha3Code:String!
    var capital:String!
    var region:String!
    
    var data:JsonModel!{
        didSet{
            name = data.name
            alpha3Code = data.alpha3Code
            capital = data.capital
            region = data.region
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text = "Name: \(name!)"
        lbl2.text = "Capital: \(capital!)"
        lbl3.text = "Alpha3Code: \(alpha3Code!)"
        lbl4.text = "Region: \(region!)"
    }

}
