//
//  SRImageProvider.swift
//  SwiftRss
//
//  Created by Bettina Katics on 20/01/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation
import UIKit

class SRImageProvider : NSObject, SRImageDownloaderOperationDelegate {
    
    private var tableView : UITableView
    lazy var imageDownloadOperationQueue : NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "imageDownloaderQueue"
        return queue
        }()
    
    init(tv : UITableView) {
        self.tableView = tv
    }
    
    
    func feedImage(feedModel : SRFeedModel, atIndexPath : NSIndexPath) {
        var downloadOperation = SRImageDownloaderOperation(feedModel: feedModel, atIndexPath: atIndexPath, delegate: self)
        self.imageDownloadOperationQueue.addOperation(downloadOperation)
    }
    
    func didFinishDownloadingImage(atIndexPath: NSIndexPath) {
        dispatch_sync(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadRowsAtIndexPaths([atIndexPath], withRowAnimation: .Fade)
        })
    }
    
    
}
