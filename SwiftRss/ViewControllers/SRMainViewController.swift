//
//  SRMainViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/15/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let urlStore = SRServiceProvider.sharedInstance.urlStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlStore.URLContainer.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell! = UITableViewCell(style: .Default, reuseIdentifier:"urlCellIdentifier")
        cell.textLabel!.text = urlStore.URLContainer[indexPath.row].absoluteString
        
        
        return cell
    }

}
