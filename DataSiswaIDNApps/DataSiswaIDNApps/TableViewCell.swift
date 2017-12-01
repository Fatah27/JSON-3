//
//  TableViewCell.swift
//  DataSiswaIDNApps
//
//  Created by abdul fatah on 11/20/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var jnisKelamin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
