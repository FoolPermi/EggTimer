//
//  ViewController.swift
//  EggTimer
//
//  Created by Permi on 2019/2/2.
//  Copyright © 2019 Permi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var timeTextField: NSTextField!
    @IBOutlet weak var eggImageView:NSImageView!
    
    @IBOutlet weak var startButton: NSButton!
    
    @IBOutlet weak var stopButton: NSButton!
    
    @IBOutlet weak var resetButton: NSButton!
    
    var eggTimer = EggTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eggTimer.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func startButtonClicked(_ sender: Any) {
        if eggTimer.isPaused {
            eggTimer.resumeTimer()
        } else {
            eggTimer.duration = 360
            eggTimer.startTimer()
        }
        configureButtonsAndMenus()
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
        eggTimer.stopTimer()
        configureButtonsAndMenus()
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
        eggTimer.resetTimer()
        updateDisplay(for: 360)
        configureButtonsAndMenus()
    }
    
    // MARK:- NSMenu Action
    @IBAction func startTimerMenuItemSelected(_ sender: NSMenuItem) {
        startButtonClicked(sender)
    }
    @IBAction func stopTimerMenuItemSelected(_ sender: NSMenuItem) {
        stopButtonClicked(sender)
    }
    @IBAction func resetTimerMenuItemSelected(_ sender: NSMenuItem) {
        resetButtonClicked(sender)
    }
}

extension ViewController: EggTimerProtocol {
    
    func timeRemainningOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval) {
        updateDisplay(for: timeRemaining)
    }
    
    func timerHasFinished(_ timer: EggTimer) {
        updateDisplay(for: 0)
    }
}

extension ViewController {
    // MARK: -Display
    func updateDisplay(for timeRemaining: TimeInterval) {
        timeTextField.stringValue = textToDisplay(for: timeRemaining)
        eggImageView.image = imageToDisplay(for: timeRemaining)
    }
    
    private func textToDisplay(for timeRemaining: TimeInterval) -> String{
        if timeRemaining == 0 {
            return "Done"
        }
        let minutesRemaining = floor(timeRemaining / 60)
        let secondRemaining = timeRemaining - (minutesRemaining * 60)
        
        let secondsDisplay = String(format: "%02d", Int(secondRemaining))
        let timeRemaingDisplay = "\(Int(minutesRemaining)):\(secondsDisplay)"
        
        return timeRemaingDisplay
    }
    
    private func imageToDisplay(for timeRemaing: TimeInterval) -> NSImage?{
        let percentageComplete = 100 - (timeRemaing / 360 * 100)
        
        if eggTimer.isStopped {
            let stopppedImageName = (timeRemaing == 0) ? "100":"stopped"
            return NSImage(named: stopppedImageName)
        }
        let imageName: String
        switch percentageComplete {
        case 0..<25:
            imageName = "0"
        case 25..<50:
            imageName = "25"
        case 50..<75:
            imageName = "50"
        case 75..<100:
            imageName = "75"
        default:
            imageName = "100"
        }
        return NSImage(named: imageName)
    }
    
    func configureButtonsAndMenus() {
        let enableStart: Bool
        let enableStop: Bool
        let enableReset: Bool
        
        if eggTimer.isStopped {
            enableStart = true
            enableStop = false
            enableReset = false
        } else if eggTimer.isPaused {
            enableStart = true
            enableStop = false
            enableReset = true
        } else {
            enableStart = false
            enableStop = true
            enableReset = false
        }
        
        startButton.isEnabled = enableStart
        stopButton.isEnabled = enableStop
        resetButton.isEnabled = enableReset
        
        if let appDelegate = NSApplication.shared.delegate as? AppDelegate {
            appDelegate.enableMenus(start: enableStart, stop: enableStop, reset: enableReset)
        }
    }
}
