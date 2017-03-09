//
//  MovieViewCell.swift
//  BootCamp1
//
//  Created by Fery Syukur on 3/9/17.
//  Copyright © 2017 Fery Syukur. All rights reserved.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    @IBOutlet weak var imgMovie: UIImageView!{
        didSet{
            imgMovie.image = UIImage(named: "artwork")
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
}
