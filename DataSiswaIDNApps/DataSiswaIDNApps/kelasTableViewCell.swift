//
//  kelasTableViewCell.swift
//  DataSiswaIDNApps
//
//  Created by FatahKhair on 11/21/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class kelasTableViewCell: UITableViewCell {
    @IBOutlet weak var kelas: UILabel!
    @IBOutlet weak var jumlah: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
