//
//  SRImageDownloaderOperation.swift
//  SwiftRss
//
//  Created by Bettina Katics on 20/01/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

protocol SRImageDownloaderOperationDelegate : class {
    func didFinishDownloadingImage(atIndexPath : NSIndexPath)
}

class SRImageDownloaderOperation: NSOperation {
 
    private let feedModel: SRFeedModel
    private let indexPath : NSIndexPath
    private weak var delegate : SRImageDownloaderOperationDelegate?
    
    init(feedModel: SRFeedModel, atIndexPath: NSIndexPath, delegate : SRImageDownloaderOperationDelegate) {
        self.feedModel = feedModel
        self.indexPath = atIndexPath
        self.delegate = delegate
        super.init()
    }
    
    override func main() {
        if self.cancelled {
            return
        }
        self.feedModel.state = .Downloading
        let imageData = NSData(contentsOfURL:self.feedModel.feedImageURL!)
        if self.cancelled {
            return
        }
        if imageData?.length > 0 {
            self.feedModel.feedImage = UIImage(data:imageData!)!
            self.feedModel.state = .Downloaded
        }
        else {
            self.feedModel.feedImage = UIImage(named: "ImagePlaceholder")!
            self.feedModel.state = .Failed
        }
//         dispatch_sync(dispatch_get_main_queue(), { () -> Void in
            self.delegate?.didFinishDownloadingImage(self.indexPath)
//         })
    }
    
}
