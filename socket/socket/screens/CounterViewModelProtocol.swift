//
//  CounterViewModelProtocol.swift
//  socket
//
//  Created by Daniel Maranhão on 09/11/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import Foundation

protocol CounterViewModelProtocol: NSKeyValueObservingCustomization {
    
    var counterValue: Int { get }
    
    func viewDidDetectInscreaseAction()
    func viewDidDetectDecreaseAction()
}
