//
//  SRContentDownloader.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation

class SRContentDownloader: NSObject {
    // add kerdojel oda, ahol lehet mondjuk nil is
    class func dataFromURL(url : NSURL, completion: (downloadedData : NSData) -> ()) {
        var request = SRRequestProvider.fetchURLContentRequest(url)
        var session = SRServiceProvider.sharedInstance.mainSession.session
        println(session)
        var downloadTask = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if response != nil && error == nil {
                completion(downloadedData: data)
            }
        }
        downloadTask.resume()
    }
}
