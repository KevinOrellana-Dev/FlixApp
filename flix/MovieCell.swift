//
//  MovieCell.swift
//  flix
//
//  Created by admin on 2/10/20.
//  Copyright © 2020 kevin.orellana06@gmail.com. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

   
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBOutlet weak var poserView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
