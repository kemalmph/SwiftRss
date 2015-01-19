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

enum BarPosition : Int {
    case Left
    case Right
}

class SRReaderContentViewController: UIViewController {
    
    private let parserManager : SRParserManager = SRParserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Latest news"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(vc: self, ps: .Left)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(vc: self, ps: .Right)
        
        parserManager.contentOfURL(SRServiceProvider.sharedInstance.urlStore.URLContainer[0]) {
        (contentArray) in
            println(contentArray)
        }
    }
    
    func addURLButtonPressed() {
        self.performSegueWithIdentifier(kFromReaderContentToDetailSegueIdentifier, sender: self)
    }
    
    func openURLContainer() {
        self.performSegueWithIdentifier(kFromReaderContentToURLContainerSegueIdentifier, sender: self)
    }

    
}
