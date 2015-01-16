//
//  SRRequestProvider.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation

class SRRequestProvider {
    
    class func fetchURLContentRequest(url : NSURL) -> NSURLRequest {
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        return request
    }
   
}
