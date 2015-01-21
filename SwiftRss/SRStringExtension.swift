//
//  SRStringExtension.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/21/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func ripHTMLTags() -> String {
        var string: String! = self
        string = self.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        return string
    }
}