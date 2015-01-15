//
//  BarButtonExtension.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/15/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func addURLBarButtonItemForViewController(viewController : UIViewController) -> UIBarButtonItem {
     
        let barButtonItem = UIBarButtonItem(image: UIImage(named:"AddURLButton"), style: UIBarButtonItemStyle.Plain, target: viewController, action: Selector("addURLButtonPressed"))
        return barButtonItem
        
    
    }
    
    convenience init(vc viewController : UIViewController) {
        
        self.init(image: UIImage(named:"AddURLButton"), style: UIBarButtonItemStyle.Plain, target: viewController, action: Selector("addURLButtonPressed"))
        
    }
    
}

