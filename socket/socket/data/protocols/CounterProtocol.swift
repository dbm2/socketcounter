//
//  CounterProtocol.swift
//  socket
//
//  Created by Daniel Maranhão on 03/10/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import Foundation

protocol CounterProtocol {
 
    func observeValue(_ recive: @escaping (Int) -> Void)
    func stopObserveValue()
    
    func increseValue()
    func decreaseValue()
}
