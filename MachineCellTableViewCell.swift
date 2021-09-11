//
//  MachineCellTableViewCell.swift
//  Image_Machine
//
//  Created by Karim Arhan on 10/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit

class MachineCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
