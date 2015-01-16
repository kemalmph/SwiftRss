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

class SRReaderContentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Latest news"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(vc: self, ps: "left")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(vc: self, ps: "right")
        SRDataParser.contentOfURL(SRServiceProvider.sharedInstance.urlStore.URLContainer[0]) {
        (dictionary) in
            println(dictionary)
        }
    }
    
    func addURLButtonPressed() {
        self.performSegueWithIdentifier(kFromReaderContentToDetailSegueIdentifier, sender: self)
    }
    
    func openURLContainer() {
        self.performSegueWithIdentifier(kFromReaderContentToURLContainerSegueIdentifier, sender: self)
    }

    
}
