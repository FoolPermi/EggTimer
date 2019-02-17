//
//  PrefsViewController.swift
//  EggTimer
//
//  Created by Permi on 2019/2/17.
//  Copyright © 2019 Permi. All rights reserved.
//

import Cocoa

class PrefsViewController: NSViewController {

    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customTextField: NSTextField!
    @IBOutlet weak var customSlider: NSSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - IBAction
    
    @IBAction func popupValueChanged(_ sender: Any) {
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
    }
}
