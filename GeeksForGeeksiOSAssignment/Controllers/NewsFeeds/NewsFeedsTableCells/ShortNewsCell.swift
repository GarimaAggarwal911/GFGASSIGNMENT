//
//  ShortNewsCell.swift
//  GeeksForGeeksiOSAssignment
//
//  Created by Vibes Com on 22/07/21.
//  Copyright © 2021 garima. All rights reserved.
//

import UIKit

class ShortNewsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var newsImage:UIImageView!
    @IBOutlet weak var outerView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.outerView.layer.cornerRadius=15
        self.outerView.clipsToBounds=true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
