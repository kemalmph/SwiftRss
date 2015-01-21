//
//  SRServiceProvider.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRServiceProvider: NSObject {
   
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : SRServiceProvider? = nil
    }
    
    private var urlStoreInstance : SRURLStore?
    private var sessionProviderInstance : SRSessionProvider?
//    private var imageProviderInstace : SRImageProvider?
    
    class var sharedInstance : SRServiceProvider {
            dispatch_once(&Static.onceToken){
            Static.instance = SRServiceProvider()
        }
        return Static.instance!
    }

    var urlStore : SRURLStore {
        if(urlStoreInstance == nil) {
            urlStoreInstance = SRURLStore()
        }
        return urlStoreInstance!;
    }
    
//    var imageProvider : SRImageProvider {
//        if(imageProviderInstace == nil) {
//            imageProviderInstace = SRImageProvider()
//        }
//        return imageProviderInstace!
//    }
    
    var mainSession : SRSessionProvider {
        if let session = sessionProviderInstance {
            return sessionProviderInstance!;
        }
        sessionProviderInstance = SRSessionProvider()
        return sessionProviderInstance!;
    }
}
