//
//  SRReaderContentTableViewCell.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/19/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRReaderContentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    
    
    func setupCell(model : SRFeedModel) -> () {
        self.titleLabel.text = model.feedTitle
        self.descriptionLabel.text = model.feedDescription
        
        
    }
}
