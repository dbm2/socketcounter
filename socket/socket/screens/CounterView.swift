//
//  ViewController.swift
//  socket
//
//  Created by Daniel Maranhão on 03/10/17.
//  Copyright © 2017 Daniel Maranhão. All rights reserved.
//

import UIKit
import SocketIO

class CounterView: UIViewController {
    
    var viewModel: CounterViewModel!
    
    private var observation: NSKeyValueObservation?
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CounterViewModel()
        
        self.observation = self.viewModel.observe(\CounterViewModel.counterValue) { [unowned self] (viewModel, change) in
            self.counterLabel.text = String(viewModel.counterValue)
        }
    }
    
    @IBAction func actionIncrease(_ sender: UIButton) {
        self.viewModel.viewDidDetectInscreaseAction()
    }
    
    @IBAction func actionDecrease(_ sender: UIButton) {
        self.viewModel.viewDidDetectDecreaseAction()
    }
}
