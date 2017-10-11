//
//  ViewController.swift
//  socket
//
//  Created by Daniel Maranhão on 03/10/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataProvider.shared.counter.observeValue { (value) in
            self.counterLabel.text = String(value)
        }
    }
    
    @IBAction func actionIncrease(_ sender: UIButton) {
        DataProvider.shared.counter.increseValue()
    }
    
    @IBAction func actionDecrease(_ sender: UIButton) {
        DataProvider.shared.counter.decreaseValue()
    }
}
