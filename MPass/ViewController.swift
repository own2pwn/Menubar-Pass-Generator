//
//  ViewController.swift
//  MPass
//
//  Created by Евгений on 07.10.16.
//  Copyright © 2016 Evgeniy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var lastTF: NSTextField!
    @IBOutlet weak var maskTF: NSTextField!
    @IBOutlet weak var lenTF: NSTextField!
    @IBOutlet weak var midTF: NSTextField!
    
    
    @IBOutlet weak var genBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lenTF.intValue = 8
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func generateBtn(_ sender: NSButton) {
        
        var mask = maskTF.stringValue
        var mid = midTF.stringValue
        var last = lastTF.stringValue
        
        if (mask == "") {
            mask = randomNumStr(3)
        }
        
        if (mid == "") {
            mid = randomString(3)
        }
        
        if (last == "") {
            last = randomString(2)
        }
        
        var pass = "\(maskTF.stringValue)\(midTF.stringValue)\(lastTF.stringValue)"
        
        let len = Int32(pass.characters.count)
        let d = lenTF.intValue - len
        
        if (d > 0) {
            pass = pass + randomString(Int(d))
        }

        let pp = NSPasteboard.general()
        pp.clearContents()
        pp.setString(pass, forType: NSPasteboardTypeString)
        
    }

    @IBAction func incLen(_ sender: AnyObject) {
        lenTF.intValue = lenTF.intValue + 1
    }
    
    func randomString(_ length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
        
    }
    
    func randomNumStr(_ length: Int) -> String {
        
        let letters : NSString = "0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
        
    }
}

