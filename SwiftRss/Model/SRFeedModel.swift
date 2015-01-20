//
//  SRFeedModel.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/20/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRFeedModel: NSObject {
   
    var feedTitle : String?
    var feedDescription : String?
    var feedURL : NSURL?
    var feedImage : UIImage?
    
    init(dictionary: NSDictionary) {
        self.feedTitle = dictionary["title"] as String!
        self.feedDescription = dictionary["description"] as String!
        self.feedURL = NSURL(string:dictionary["link"] as String!)
        
        
    }
    
}
