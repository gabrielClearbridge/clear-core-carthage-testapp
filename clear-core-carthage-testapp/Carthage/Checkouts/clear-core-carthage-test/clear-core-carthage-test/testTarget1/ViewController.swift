//
//  ViewController.swift
//  testTarget1
//
//  Created by Gabriel Siu on 2019-07-11.
//  Copyright © 2019 Clearbridge Mobile Inc. All rights reserved.
//

import UIKit
import clear_core_carthage_test

class ViewController: UIViewController {
    
    var jailbreakDetection = JailbreakDetection()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Test target 1")
        if jailbreakDetection.isJailbreakDetected() {
            print("Jailbreak detected")
        }
    }


}

