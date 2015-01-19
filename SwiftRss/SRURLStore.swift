//
//  SRURLStore.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation

class SRURLStore: NSObject {
    
    var URLContainer : Array<NSURL>
    
    override init() {
        
        self.URLContainer = Array()
        self.URLContainer.append(NSURL(string:"http://feeds.bbci.co.uk/news/uk/rss.xml?edition=uk")!)
        super.init()
       
    }
    
}
