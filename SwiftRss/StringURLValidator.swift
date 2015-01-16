//
//  StringURLValidator.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/15/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation

extension String {
    
    func isValidURL() -> Bool {
        return self.hasPrefix("http") || self.hasPrefix("https")
    }
}