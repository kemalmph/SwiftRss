//
//  SRFeedParser.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/19/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//

import Foundation


enum ParserError : Int {
    case MissingParameters
}

protocol SRFeedParserDelegate {
    func parsingDidFinishWithResult(result : NSArray?)
    func parsingDidFinishWithError(error : NSError)
}

@objc class SRFeedParser: NSObject, NSXMLParserDelegate {
    
    var delegate : SRFeedParserDelegate?
    
    private var url : NSURL?
    private var data : NSData?
    
    private var parser : NSXMLParser?
    private var feedContentArray = NSMutableArray()
    private var aFeedContentDict = NSMutableDictionary()
    private var currentElement : NSString?
    private var currentNodeContent : NSMutableString?
    
    init(url : NSURL, data : NSData, delegate : SRFeedParserDelegate) {
        self.url = url
        self.data = data
        self.delegate = delegate
        super.init()
    }
    
    func startParsing() {
        
        if self.url == nil || self.data == nil {
            let error = NSError(domain: "com.switfrss.missingParamaters", code:ParserError.MissingParameters.rawValue, userInfo:nil)
            self.delegate?.parsingDidFinishWithError(error)
            return
        }
        
        parser = NSXMLParser(data: data)
        parser?.delegate = self
        parser?.parse()
    }
   
    func parserDidEndDocument(parser: NSXMLParser!) {
        self.delegate?.parsingDidFinishWithResult(self.feedContentArray)
    }
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        self.delegate?.parsingDidFinishWithError(parseError)
    }
    
    func parser(parser: NSXMLParser!, validationErrorOccurred validationError: NSError!) {
        self.delegate?.parsingDidFinishWithError(validationError)
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        self.currentElement = elementName
        if elementName == "item" {
            if aFeedContentDict.count > 0 {
                var tmpFeedContentDict = NSDictionary(dictionary: aFeedContentDict)
                feedContentArray.addObject(tmpFeedContentDict)
                aFeedContentDict.removeAllObjects()
            }
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        self.currentNodeContent = nil
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
    
        var objcString : NSString! = string
        
        if objcString.rangeOfString("\n").location == NSNotFound {
            
            if self.currentNodeContent == nil {
                self.currentNodeContent = NSMutableString()
            }
            self.currentNodeContent!.appendString(string)
            aFeedContentDict.setObject(self.currentNodeContent!, forKey:self.currentElement!)
            
        }
        
    }
}
