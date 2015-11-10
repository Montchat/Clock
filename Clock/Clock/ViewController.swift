//
//  ViewController.swift
//  Clock
//
//  Created by Joe E. on 11/10/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var countdownTextField: UITextField!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var currentTimeTimer: NSTimer?
    var countDownTimer: NSTimer?
    
    @IBAction func pressedStart(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCurrentTimer() {
        
    }
    
    func updateCountDown() {
        
        
        
    }


}

