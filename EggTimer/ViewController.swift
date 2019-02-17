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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
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


