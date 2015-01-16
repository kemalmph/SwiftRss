//
//  SRDataParser.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRDataParser: NSObject {
 
    class func contentOfURL(url : NSURL, completion : (NSDictionary?) -> ()) {
        SRContentDownloader.dataFromURL(url){ (downloadedData : NSData) in
            var error: NSError?
            var valami : AnyObject? = NSJSONSerialization.JSONObjectWithData(downloadedData, options: NSJSONReadingOptions.MutableLeaves, error: &error)
//            let jsonDictionary = NSJSONSerialization.JSONObjectWithData(downloadedData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
//            completion(valami)
        }
    }
}
