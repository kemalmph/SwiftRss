//
//  SRSessionProvider.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation

class SRSessionProvider {
    var session : NSURLSession!
    init() {
        session = NSURLSession.sharedSession()
    }
}
