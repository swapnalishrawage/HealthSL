//
//  timecellCollectionViewCell.swift
//  Salado
//
//  Created by Mac on 28/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class timecellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewback: UIView!
    @IBOutlet weak var lbltime1: UILabel!
    @IBOutlet weak var btntime: UIButton!
    @IBOutlet weak var lbltime: UILabel!
    
    
    
    func updatecell(time:String)
    {
        lbltime1.text = time
    }
}
