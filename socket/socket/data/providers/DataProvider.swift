//
//  DataProvider.swift
//  socket
//
//  Created by Daniel Maranhão on 03/10/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import SocketIO

class DataProvider: DataProtocol {
    
    static let shared: DataProtocol = DataProvider()
    
    fileprivate static let url: URL = URL(string: "http://172.16.1.14:3000")!
    
    fileprivate var socket: SocketIOClient
    
    var counter: CounterProtocol
    
    init() {
        self.socket = SocketIOClient(socketURL: DataProvider.url, config: [.compress]) //.log(true)
        
        self.socket.on(clientEvent: .connect) { (data, ack) in
            print("DataProvider: Socket.io client connected with the server.")
        }
        
        self.socket.on(clientEvent: .disconnect) { (data, ack) in
            print("DataProvider: Socket.io client disconnect from the server.")
        }
        
        self.socket.on(clientEvent: .error) { (data, ack) in
            print("DataProvider: Socket.io client received an error.")
        }
        
        self.socket.connect()
        
        self.counter = CounterProvider(socket: self.socket)
    }
}

