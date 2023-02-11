//
//  TableViewCell.swift
//  81-82
//
//  Created by hamdi on 05/02/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
