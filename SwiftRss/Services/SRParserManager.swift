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
    private var feedCounter : Int = 0
    private  var modelArray : Array<SRFeedModel> = Array()
    
    func contentOfURL(urlArray : Array<NSURL>, completion : ((success : Bool, content: Array<SRFeedModel>?) -> ())) {
        self.completion = completion
        self.feedCounter = urlArray.count
        for url in urlArray {
            SRContentDownloader.dataFromURL(url){ (downloadedData : NSData) in
                var parser : SRFeedParser = SRFeedParser(url: url, data: downloadedData, delegate : self)
                parser.startParsing()
            }
        }
    }
    
    func parsingDidFinishWithResult(var result : Array<AnyObject>?) {
        //TODO find a better solution to remove title section from feeds
        result!.removeAtIndex(0)
        for dict in result! {
            var feedContent = SRFeedModel(dictionary: dict as NSDictionary)
            self.modelArray.append(feedContent)
        }
        self.feedCounter--
        if self.feedCounter == 0 {
            self.modelArray.sort({ $0.feedComparePubDate > $1.feedComparePubDate })
            self.completion(success: true, content: modelArray)
        }
    }
    
    func parsingDidFinishWithError(error : NSError) {
        self.completion(success: false, content: nil)
    }
    
}
