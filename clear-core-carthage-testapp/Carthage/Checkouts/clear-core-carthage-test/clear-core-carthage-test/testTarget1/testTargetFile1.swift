//
//  testTargetFile1.swift
//  testTarget1
//
//  Created by Gabriel Siu on 2019-07-11.
//  Copyright © 2019 Clearbridge Mobile Inc. All rights reserved.
//

import clear_core_carthage_test
import Foundation

public class testClassOne {
    let testVariableOne: String
    let jailbreakDetection: JailbreakDetection
    
    public init() {
        self.testVariableOne = "test"
        self.jailbreakDetection = JailbreakDetection()
    }
}
