//
//  SRReaderContentViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/16/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

let kFromReaderContentToDetailSegueIdentifier = "FromReaderContentToDetailSegueIdentifier"
let kFromReaderContentToURLContainerSegueIdentifier = "FromReaderContentToURLContainerSegueIdentifier"
let kFromReaderContentToWebViewControllerSegueIdentifier = "FromReaderContentToWebViewControllerSegueIdentifier"
let kReaderContentIdentifier = "readerContentIdentifier"


enum BarPosition : Int {
    case Left
    case Right
}

class SRReaderContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let parserManager : SRParserManager = SRParserManager()
    private var contentArray : Array<SRFeedModel> = Array()
    private var choosenCell : Int = 0
    private var imageProvider : SRImageProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Latest news"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(vc: self, ps: .Left)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(vc: self, ps: .Right)
        imageProvider = SRImageProvider(tv : self.tableView)
        self.refreshFeeds()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(kReaderContentIdentifier) as SRReaderContentTableViewCell
        
        var feedModel = self.contentArray[indexPath.row] as SRFeedModel
        cell.setupCell(feedModel)
        
        if feedModel.state == .New {
            imageProvider?.feedImage(feedModel, atIndexPath: indexPath)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.choosenCell = indexPath.row
        self.performSegueWithIdentifier(kFromReaderContentToWebViewControllerSegueIdentifier, sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kFromReaderContentToWebViewControllerSegueIdentifier {
            var destinationViewController = segue.destinationViewController as SRWebViewController
            var url = self.contentArray[choosenCell].feedURL
            destinationViewController.contentURL = url
        }
    }
    
    func refreshFeeds() {
        NSNotificationCenter.defaultCenter().postNotificationName(kStartLoading, object: nil)
        parserManager.contentOfURL(SRServiceProvider.sharedInstance.urlStore.URLContainer) {
            (success, contentArray) in
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                NSNotificationCenter.defaultCenter().postNotificationName(kStopLoading, object: nil)
                if(success) {
                    self.contentArray = contentArray!
                    self.tableView.reloadData()
                } else {
                    var parserFailAlert = UIAlertController(title:"error", message: "parsing has failed, please try again later", preferredStyle:.Alert)
                    parserFailAlert.addAction(UIAlertAction(title: "ok", style: .Cancel, handler: nil))
                    self.presentViewController(parserFailAlert, animated: true, completion: nil)
                }
            })
        }
    }
    
    func addURLButtonPressed() {
        self.performSegueWithIdentifier(kFromReaderContentToDetailSegueIdentifier, sender: self)
    }
    
    func openURLContainer() {
        self.performSegueWithIdentifier(kFromReaderContentToURLContainerSegueIdentifier, sender: self)
    }
    
    
}
