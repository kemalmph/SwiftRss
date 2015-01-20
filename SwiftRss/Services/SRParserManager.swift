//
//  SRDataParser.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRParserManager: NSObject, SRFeedParserDelegate {
    
    private var completion : ((success : Bool, content: Array<SRFeedModel>?) -> ())!
    
    func contentOfURL(url : NSURL, completion : ((success : Bool, content: Array<SRFeedModel>?) -> ())) {
        SRContentDownloader.dataFromURL(url){ (downloadedData : NSData) in
            self.completion = completion
            var parser : SRFeedParser = SRFeedParser(url: url, data: downloadedData, delegate : self)
            parser.startParsing()
        }
    }
    
    func parsingDidFinishWithResult(result : NSArray?) {
        var modelArray : Array<SRFeedModel> = Array()
        for dict in result! {
            var feedContent = SRFeedModel(dictionary: dict as NSDictionary)
            modelArray.append(feedContent)
        }
        
        self.completion(success: true, content: modelArray)
    }
    
    func parsingDidFinishWithError(error : NSError) {
        self.completion(success: false, content: nil)
    }
    
}
