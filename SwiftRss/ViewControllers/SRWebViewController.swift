//
//  SRWebViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/20/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var contentURL : NSURL? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().postNotificationName(kStartLoading, object: nil)
        var request = SRRequestProvider.fetchURLContentRequest(contentURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(webView: UIWebView){
        NSNotificationCenter.defaultCenter().postNotificationName(kStopLoading, object: nil)
    }
}
