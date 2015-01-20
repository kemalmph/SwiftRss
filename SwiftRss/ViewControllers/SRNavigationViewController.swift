//
//  SRNavigationViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/20/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

let kStartLoading = "startLoading"
let kStopLoading = "stopLoading"

class SRNavigationViewController: UINavigationController {

    var effectLayer : UIView?
    var activityIndicator : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupEffecLayer()
        self.setupActivityIndicator()
        self.setupNotifications()

        // Do any additional setup after loading the view.
    }
    
    func setupEffecLayer() {
        self.effectLayer = UIView(frame: self.view.bounds)
        self.effectLayer?.backgroundColor = UIColor.grayColor()
        self.effectLayer?.alpha = 0.0;
        self.view.addSubview(self.effectLayer!)
    }
    
    func setupActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:.White)
        self.activityIndicator?.center = self.view.center
        self.activityIndicator?.hidesWhenStopped = true
        self.view.addSubview(self.activityIndicator!)
    }
    
    func setupNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"startLoading", name: kStartLoading, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"stopLoading", name: kStopLoading, object: nil)
    }

    func startLoading() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.activityIndicator?.startAnimating()
        UIView.animateWithDuration(0.3, animations: {
            self.effectLayer!.alpha = 0.5
        })
    }
    
    func stopLoading() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.activityIndicator?.stopAnimating()
        UIView.animateWithDuration(0.3, animations: {
            self.effectLayer!.alpha = 0.0
        })
    }
    
}
