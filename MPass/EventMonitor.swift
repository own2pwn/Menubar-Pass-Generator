//
//  EventMonitor.swift
//  MPass
//
//  Created by Евгений on 07.10.16.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Cocoa

open class EventMonitor {
    
    fileprivate var monitor: AnyObject?
    fileprivate let mask: NSEventMask
    fileprivate let handler: (NSEvent?) -> ()
    
    public init(mask: NSEventMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    open func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler) as AnyObject?
    }
    
    open func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
