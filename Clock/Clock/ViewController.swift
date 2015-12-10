//
//  ViewController.swift
//  Clock
//
//  Created by Joe E. on 11/10/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //UI:
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var countdownTextField: UITextField!
    @IBOutlet weak var countdownLabel: UILabel!
    
    //Two timers
    var currentTimeTimer: NSTimer?
    var countDownTimer: NSTimer?
    
    var count: Double = 0
    
    @IBAction func pressedStart(sender: AnyObject) {
        
        //unwrapping the cundDownTimer
        guard countDownTimer == nil else { return }
        
        //making sure there is text
        guard let secondsText = countdownTextField.text else { return }
        //count has to be a double
         count = Double(secondsText) ?? 0
        
        //checking to see if count is positive and update the countDown
        if count > 0 {
            countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCountDown", userInfo: nil, repeats: true)
            countdownTextField.text = ""
            countdownTextField.resignFirstResponder()
        }
        
    }
    //clear the timer and invalidate it. reset the label text to 0.
    @IBAction func pressedClear(sender: AnyObject) {
        countDownTimer?.invalidate()
        countDownTimer = nil
        
        countdownLabel.text = "00:00:00"
        
    }
    
    @IBAction func pressedLap(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //seet the delegate
        countdownTextField.delegate = self
        updateCurrentTimer()
        currentTimeTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCurrentTimer", userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func updateCurrentTimer() {

        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        currentTimeLabel.text = formatter.stringFromDate(date)
        
    }
    
    func updateCountDown() {
        
        count--
        //creating hours. minutes. and seconds.
        let hours = Int(floor(count / 3600))
        let minutes = Int(floor((count % 3600) / 60))
        let seconds = Int(count % 60)
        
        let hourString = hours < 10 ? "0\(hours)" : " \(hours)"
        let minuteString = minutes < 10 ? "0\(minutes)" : " \(minutes)"
        let secondString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        
        
        //applying to label
        countdownLabel.text = "\(hourString):\(minuteString):\(secondString)"
        
        if count <= 0 {
            count++
            updateCountDown()
            countDownTimer?.invalidate()
            countDownTimer = nil
            
        }
        
    }

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()

    }
    
    
    
}

