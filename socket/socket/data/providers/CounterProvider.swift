//
//  CounterProvider.swift
//  socket
//
//  Created by Daniel Maranhão on 03/10/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import Foundation
import SocketIO

class CounterProvider: CounterProtocol {
    
    fileprivate unowned var socket: SocketIOClient
    
    init(socket: SocketIOClient) {
        self.socket = socket
    }
    
    func observeValue(_ recive: @escaping (Int) -> Void) {
        self.socket.on("counterChanged") { (data, ack) in
            if let value = data[0] as? Int {
                recive(value)
            }
        }
        
        if (self.socket.status == .connected) {
            self.socket.emit("updateCounter", [])
        } else {
            self.socket.once(clientEvent: .connect, callback: { (data, ack) in
                self.socket.emit("updateCounter", [])
            })
        }
    }
    
    func stopObserveValue() {
        self.socket.off("counterChanged")
    }
    
    func increseValue() {
        self.socket.emit("increaseCounter", [])
    }
    
    func decreaseValue() {
        self.socket.emit("decreaseCounter", [])
    }
}
