//
//  SRURLDefinerViewController.swift
//  SwiftRss
//
//  Created by Daniel Metzing on 1/15/15.
//  Copyright (c) 2015 Daniel Metzing. All rights reserved.
//


import UIKit

class SRURLDefinerViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    let kAlertTitle = "title"
    let kAlertMessage = "message"
    
    @IBAction func saveButtonPressed(sender: UIButton) {
        
        var messageTextDictionary : [String:String]
        
        if(!urlTextField.text.isValidURL()) {
            messageTextDictionary = self.setupTextForInvalidMessage()
        } else {
            messageTextDictionary = self.setupTextForValidMessage()
            var URLStore : SRURLStore! = SRServiceProvider.sharedInstance.urlStore
            URLStore.URLContainer.append(NSURL(string: self.urlTextField.text)!)
        }
        
        let invalidURLAlert : UIAlertController = UIAlertController(title:messageTextDictionary[kAlertTitle], message:messageTextDictionary[kAlertMessage], preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "ok", style: .Cancel, handler: { action -> Void in })
        
        invalidURLAlert.addAction(okAction)
        self.presentViewController(invalidURLAlert, animated:true, completion: { () -> Void in
            self.urlTextField.text = ""
        })
    }

    func setupTextForValidMessage() -> [String:String] {
        let messageTextDictionary : Dictionary<String,String> = [kAlertTitle : "url saved",kAlertMessage : "add an other or go back"]
        return messageTextDictionary
    }
    
    func setupTextForInvalidMessage () -> [String:String] {
        let messageTextDictionary : Dictionary<String,String> = [kAlertTitle : "invalid url",kAlertMessage : "please add a valid URL"]
        return messageTextDictionary
        
    }
    
}
