//
//  SRMainViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/15/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

class SRMainViewController: UIViewController {
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(vc: self)
        
        //UIBarButtonItem.addURLBarButtonItemForViewController(self)
        
        
    }
    
    func addURLButtonPressed() {
    
        println("add button pressed")
        
    }
    

}
