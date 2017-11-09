//
//  CounterViewModel.swift
//  socket
//
//  Created by Daniel Maranhão on 09/11/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import Foundation

@objcMembers class CounterViewModel: NSObject {
    
    dynamic var counterValue: Int = 0
    
    override init() {
        super.init()
        
        DataProvider.shared.counter.observeValue { [unowned self] (value) in
            self.counterValue = value
        }
    }
 
    func viewDidDetectInscreaseAction() {
        DataProvider.shared.counter.increseValue()
    }
    
    func viewDidDetectDecreaseAction() {
        DataProvider.shared.counter.decreaseValue()
    }
}
