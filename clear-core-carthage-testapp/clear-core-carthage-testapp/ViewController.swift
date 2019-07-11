//
//  ViewController.swift
//  clear-core-carthage-testapp
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
        // Do any additional setup after loading the view.
        if jailbreakDetection.isJailbreakDetected() {
            print("Jailbreak detected")
        }
    }


}

