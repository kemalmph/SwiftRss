//
//  SRFeedModel.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/20/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

enum ImageState {
    case New
    case Downloading
    case Downloaded
    case Failed
}


class SRFeedModel: NSObject {
   
    var feedTitle : String
    var feedDescription : String
    var feedURL : NSURL?
    var feedImageURL : NSURL?
    var feedImage = UIImage(named: "ImagePlaceholder")
    var state : ImageState = .New
    var feedDisplayPubDate : String?
    var feedComparePubDate : String?
    
    init(dictionary: NSDictionary) {
        self.feedTitle = dictionary["title"] as String!
        self.feedDescription = dictionary["description"] as String!
        self.feedURL = NSURL(string:dictionary["guid"] as String!)
       // self.feedImageURL = NSURL(string: dictionary["guid"] as String!)
        var(displayString, compareString) = SRDateHelper().dayAndTime(dictionary["pubDate"] as String!)
        self.feedDisplayPubDate = displayString
        self.feedComparePubDate = compareString
        
    }
}
