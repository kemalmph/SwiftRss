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
    @IBOutlet weak var pubDateLabel: UILabel!
    
    func setupCell(model : SRFeedModel) -> () {
        self.titleLabel.text = model.feedTitle
        self.descriptionLabel.text = model.feedDescription
        self.contentImageView.image = model.feedImage
        self.pubDateLabel.text = model.feedDisplayPubDate
    }
    
}
