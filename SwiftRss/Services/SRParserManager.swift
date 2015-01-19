//
//  SRDataParser.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRParserManager: NSObject, SRFeedParserDelegate {
    
    var completion : ((NSArray?) -> ())!// = {}
    
    
    func contentOfURL(url : NSURL, completion : (NSArray?) -> ()) {
        SRContentDownloader.dataFromURL(url){ (downloadedData : NSData) in
            self.completion = completion
            var parser : SRFeedParser = SRFeedParser(url: url, data: downloadedData, delegate : self)
            parser.startParsing()
        }
    }
    
    func parsingDidFinishWithResult(result : NSArray?) {
        self.completion(result)
    }
    
    func parsingDidFinishWithError(error : NSError) {
        println(error)
    }
    
}
