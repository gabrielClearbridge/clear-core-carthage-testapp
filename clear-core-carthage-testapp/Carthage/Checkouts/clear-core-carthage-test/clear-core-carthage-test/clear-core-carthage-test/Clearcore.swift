//
//  Clearcore.swift
//  Clearcore
//
//  Created by Gabriel Siu on 2019-07-05.
//  Copyright © 2019 Clearbridge Mobile Inc. All rights reserved.
//

import Foundation

public class Clearcore {
    let jailbreakDetection: JailbreakDetection
    
    public init() {
        self.jailbreakDetection = JailbreakDetection()
    }
    
    public func isJailbreakDetected() -> Bool {
        return jailbreakDetection.isJailbreakDetected()
    }
}
