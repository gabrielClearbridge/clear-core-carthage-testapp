//
//  JailbreakDetection.swift
//  Clearcore
//
//  Created by Gabriel Siu on 2019-07-03.
//  Copyright © 2019 Clearbridge Mobile Inc. All rights reserved.
//

import UIKit

@objcMembers
public final class JailbreakDetection {
    
    // MARK: Properties
    private let fileManager: FileManager
    
    // MARK: Initialization
    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    // MARK:
    public func isJailbreakDetected() -> Bool {
        let paths: [String] = [.cydiaPath,
                               .sileoPath,
                               .mobileSubstratePath,
                               .bashPath,
                               .sshdPath,
                               .aptPath,
                               .libAptPath,
                               .sshdPath]
        if UIDevice.isSimulator { return false }
        if UIApplication.shared.canOpen(url: .cydiaUrlScheme) { return true }
        if fileManager.filesExist(for: paths) { return true }
        if fileManager.canAccessPrivateFolder { return true }
        if paths.canOpenPaths { return true }
        return false
    }
}

// MARK: - FileManager Extension
private extension FileManager {
    /// Returns true if any of the provided filepaths exist
    func filesExist(for paths: [String]) -> Bool {
        for path in paths {
            if fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
    
    var canAccessPrivateFolder: Bool {
        let path = "/private/" + UUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: .utf8)
            try self.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }
}

// MARK: - Array Extension
private extension Array where Element == String {
    /// Returns true if any of the filepaths contained in the array can be accessed
    var canOpenPaths: Bool {
        for path in self {
            if canOpen(path: path) {
                return true
            }
        }
        return false
    }
    
    private func canOpen(path: String) -> Bool {
        let file = fopen(path, "r")
        guard file != nil else { return false }
        fclose(file)
        return true
    }
}

// MARK: - UIApplication Extension
private extension UIApplication {
    /// Returns true if the provided String can be opened as a URL scheme
    func canOpen(url: String) -> Bool {
        if let url = URL(string: url) {
            if UIApplication.shared.canOpenURL(url) {
                return true
            }
        }
        return false
    }
}

// MARK: - UIDevice Extension
private extension UIDevice {
    static var isSimulator: Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
}

// MARK: - String Extension
private extension String {
    static let cydiaUrlScheme = "cydia://package/com.example.package"
    static let cydiaPath = "/Applications/Cydia.app"
    static let sileoPath = "/Applications/Sileo.app"
    static let mobileSubstratePath = "/Library/MobileSubstrate/MobileSubstrate.dylib"
    static let bashPath = "/bin/bash"
    static let sshdPath = "/usr/sbin/sshd"
    static let aptPath = "/etc/apt"
    static let libAptPath = "/private/var/lib/apt/"
    static let sshPath = "/usr/bin/ssh"
}
